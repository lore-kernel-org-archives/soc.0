Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF2722BAC0
	for <soc@lists.linux.dev>; Thu, 16 Jan 2025 16:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737045606; cv=none; b=kE0FQJtUsRxc8MHVaQ5kHYhU4swpgFSDfYyYx36cffZ+C7EahI4h6WjpegJxTDn8QdjJ33n2fBhVbIUygKj73drNcZG3t2VrZVXGRzK5RAYAbQg8OROKekHjRGz/kD3YQWd7gXcEO3qCbH+MY/1Fgec0VFxKKAiJZ6qv9xsgdzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737045606; c=relaxed/simple;
	bh=fG8oE1juEGrliOCrir1svt09KexTcH6iPqxmAlfR+Ts=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=r5qhhBAOscQWfaejmPSukCwRx7EvAL9dz6zZFDYiAprPAHvmDngeC+9vGlRsmIGMGEkim9VWl6xgLQn1JoaFY4kYfcKJTLM2+al2Bui5QBNl7xcTDR444EomvCtZp9SnFZNHslMUJY2dqUd7zQ6DS0byZl2BZfp0gvLyn4WY5Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=FHVoTLAt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WZlOcb7X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="FHVoTLAt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WZlOcb7X"
Received: by smtp.kernel.org (Postfix)
	id 37990C4CEE3; Thu, 16 Jan 2025 16:40:06 +0000 (UTC)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 96B80C4CEE1;
	Thu, 16 Jan 2025 16:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 96B80C4CEE1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8E75F25401B5;
	Thu, 16 Jan 2025 11:40:03 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 16 Jan 2025 11:40:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737045603;
	 x=1737132003; bh=40KJOXv60mO2B00V/aYC6f9+sn/keJ57Wm8iDkp1kJY=; b=
	FHVoTLAtwQs6ELgcDQ68iDAE2D6Lt5iVp/ogZXzkTASJ/N6ln/TOMy5KyUTf22Jy
	B4xK73btxwNiqYcAp9dHPsjB40igvVZgKUiUIDA5ifBymcZnWsNtdgoFq0sAc+Av
	iQFAbvy68sLZUmeOROUo1fN+eA+q+JPBYd76XAOaATurJdTHmBND3qy+T8/Q2aP4
	RQYjB9tM8+V3tYjfaZoOwlDmJfIPl7qBb9tGwXj8056pR0pfJoUukl7mps7Rbrgx
	bbXFCnrK3NRFMoinkilMmaTGtQ8K8WmrZ4kM6t4UmzraKqCVbZ0EgO0bbZMyQfne
	YLuQnHntmM42JOjBdPHGyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1737045603; x=
	1737132003; bh=40KJOXv60mO2B00V/aYC6f9+sn/keJ57Wm8iDkp1kJY=; b=W
	ZlOcb7XXVxe4TfaP4j/D9FFQx+Dcu97Rt9CaTu9s7iJhTZyMiioBgtjh6sBrUlBG
	enfK5Mhqg0mZzzuv6Fj+PQznYE+2EYNnhoT4zjiIoe1mHy5n73iHj6FSylG1NDrK
	3U/KIe6A6farOImUa+3Izow1PwlnH61fRqpOsIAXXplZm2TjgdiRgQ50uM4lSbBE
	dFFRWgyzKbfvKTcij6plppsIgDshZufUVAnUxf0OV0q2Q5PGqzAW9x2oi0DBWLDe
	0srYhKD5YtOV9Y19m5izE6o/uhIJp5CGQkYK1QMUhsjhGk7Y0kpGC8fmtEzyGyWN
	nNDPEi8kIMDqYD6iUCacA==
X-ME-Sender: <xms:YzaJZ4CBe_9rnrgAYSoixMPM4Eol6-yBIxjqNdv7GcHaVTKk02dLRA>
    <xme:YzaJZ6g_5WdKylcZ7Ppif66herfPwvQ8-eOGTYsaSgwmcs-tSf8ZUFwz5prlGJw8K
    Us75_uraOnmHuyQXJI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeiuddgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepkhhhihhlmhgrnhessggrhihlihgsrh
    gvrdgtohhmpdhrtghpthhtohepphgrthhrihgtvgdrtghhohhtrghrugesfhhoshhsrdhs
    thdrtghomhdprhgtphhtthhopegrrhhmsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hsohgtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrvhholhhmrghtsehmvgdrtgho
    mh
X-ME-Proxy: <xmx:YzaJZ7liDYqhkfn_8Gsezl78eOdkYUcXs7Skq9I5u-oUdDm05RnI5Q>
    <xmx:YzaJZ-yq1IOdjjZxk5vgyz-tWtopdsjKkk-kpimTT0iOQi_K3lXwIA>
    <xmx:YzaJZ9SS8KhHY10CgR6sPOruaF75K1cgEQpkJJ4Fk_DTwnKhVFEA5w>
    <xmx:YzaJZ5aYr8aL5h4ZmmbHKfWNXUN0fTl8RtmOONZC7twWZ90eiM187A>
    <xmx:YzaJZ7OkQDVwxsBLjNJ_j_VlMB65vrmV1jvC2bNyhcvIhbc_V1eaiTj7>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 192C42220072; Thu, 16 Jan 2025 11:40:03 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 16 Jan 2025 17:39:42 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Patrice Chotard" <patrice.chotard@foss.st.com>,
 "Kevin Hilman" <khilman@baylibre.com>, arm <arm@kernel.org>, soc@kernel.org
Cc: "Alain Volmat" <avolmat@me.com>
Message-Id: <1d63b3e2-e780-4132-8669-83c51ac378c3@app.fastmail.com>
In-Reply-To: <736426f7-2c4d-4627-8626-e9b8ed65ad32@foss.st.com>
References: <f44cb1f0-4d91-4e25-8b1f-3dd9a7bed62b@foss.st.com>
 <736426f7-2c4d-4627-8626-e9b8ed65ad32@foss.st.com>
Subject: Re: [GIT PULL] STi DT changes for v6.14 #1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jan 16, 2025, at 11:07, Patrice CHOTARD wrote:
> Hi 
>
> Any chance for this pull request to be merged for v6.14 ?
>

Done now.

     Arnd
