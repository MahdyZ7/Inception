``` mermaid
%%{init: {'theme': 'default', "flowchart" : { "curve" : "linear" } } }%%
flowchart TB
	 in[Login] --> B{Authenticate}
	 B -- yes --> C[2FA]
	 B -- No --> in
	 C --> D{2FA Auth}
	 D -- No --> C
	 D -- Yes --> F[Dashboard]

	 F --> G[Logout]
	 G --> in
	 F--> H[Chat]
	 F --> I[profile setings]
	 F --> J[play game]
	 J --> K{paly online?}


	 K -- No --> O[Game]
	 K -- Yes --> M[Match making]
	 M --> N{Found match}
	 N -- No --> K
	 N -- Yes --> O[game]
	 O --> P{play again?}
	 P -- No --> F
	 P -- Yes --> Q{Rematch}
	 Q -- No --> J 
	 Q -- Yes --> O

```