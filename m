Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4D3318EC7
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 16:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775061247; cv=none; b=Ji6jVgfsnT4rtDJjXwQ8/KNZ6gEWcu9+K6NDgFXVM+XyVNPEPzVmK4m0P0/CgqQVCw78+xFG4NfJSuMx8Hhh8FNSRmjzFiD/5lnnlDhHRHzYqwO3yAYSJAvh5p6jUOmZ+wywLRePis5sVT/0iU2l6YzGkk+ZS19Q7ayijimiJT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775061247; c=relaxed/simple;
	bh=dDV0FRbqRcglCtGWOQOemOcdBGhYh9Vt1LxboKfUbYM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Pbeb1QbrnuZgaQffOe3bZ827IydSoKqoRXNwaNrKtfMymNTU4c3Ts7HCXPCDWRzHx7MiaEk+nAJdfOIobWmHtU7K5CfCZDgig6YPIKEm/x17TT9izDEp6/YyqGgnEAp+IuL18tYQEvkqqEz4uTfdf4KMa3MlKbbeu/SWhvEvfzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=g14YNAjM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RkapDPRw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="g14YNAjM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RkapDPRw"
Received: by smtp.kernel.org (Postfix)
	id 8CE38C2BCAF; Wed,  1 Apr 2026 16:34:06 +0000 (UTC)
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E6CEC19421;
	Wed,  1 Apr 2026 16:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4E6CEC19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 24985EC01CF;
	Wed,  1 Apr 2026 12:34:03 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 01 Apr 2026 12:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775061243;
	 x=1775147643; bh=eNyjEC1krGnXx7stQTOSVbw/FrakGO4Ep3sSimp9/m8=; b=
	g14YNAjMYEOBftpeojjGYB/xes7Y/Pm+wBJzYpM2hSTy6wxWpy6oIh15+fWP7Dcm
	RmAItmu8F5/OzeKfktKdCPG61nccS5pK2pHd5C46aZUjdqwrmMRLQS+2PTYfakIR
	hiSc1+eV/8UxVLVo72Qq2VdI/8Lco0RWFWdekbOV7VVfNOOsSIVbLR+7CuJdZHhr
	IPY04K3y4RnSLMpWWeHCJvZHElGrLh+ffu+jpXNkzJPS2F3HW6Ik675zgAGIio+E
	7W+h4NnEPvtELASHgU9ZGKBIr1oS/ThqKZZ8iHXv23ch5zM+TYRPohqFUcUgPZB4
	BZ8gfIbaGukIdOvcHkX0ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775061243; x=
	1775147643; bh=eNyjEC1krGnXx7stQTOSVbw/FrakGO4Ep3sSimp9/m8=; b=R
	kapDPRwiNBtgNNmu+Hb4gikyUXhHcqPNUYtNLs01xxePVNEewUUeA2dWtj/vx7bs
	mXfgBHYiV2Q2bD6TMilaqJVIgS7wJ2rezeN3mbOWF6a7gghXZ/W27Ihj/gOKHvYX
	4iLHEZhBuR/+qtkrbllHY/sw0vOtgehuqArP9P441MHbmojbUKs3q7XC5LYaReLv
	9SIbg1dLCakCUqsBE0a0QCgLmiEzvY5FZkMvpJsmywEEKxnbSc8h0OCGxCprRWew
	TMHpf8pNXEcVqlTCqpAUF8TabBMvDPVJ8d977O8u1/yAMu/gfOuANQvlsR23sGSj
	i5wzJYNZT1r9tTdN3G/xQ==
X-ME-Sender: <xms:-kjNaevDchDeWeh52EWYO3V1St1mUDxioq7Hq1v943NaCuxJnOMA5Q>
    <xme:-kjNaeRgFV8_CvIerqgI2adZj0ydupSHViLehQgsRJNi0ZSz2nxziNSksffSUqDnA
    62RPcES_BXaNP2J5Gka-wSzMCqpg16ao4T_FHARreY8INgOMG984T03>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefhnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphht
    thhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsggtmhdqkhgvrhhnvg
    hlqdhfvggvuggsrggtkhdqlhhishhtsegsrhhorggutghomhdrtghomhdprhgtphhtthho
    pehflhhorhhirghnrdhfrghinhgvlhhlihessghrohgruggtohhmrdgtohhmpdhrtghpth
    htohepfigrhhhrvghnshhtsehgmhigrdhnvghtpdhrtghpthhtohepmhgtrghnrghlsehi
    ghgrlhhirgdrtghomhdprhgtphhtthhopehkhhhilhhmrghnsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghh
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsohgtsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehgrhgvghhorhdrhhgvrhgsuhhrghgvrheslhhinhhuthhrohhnihigrdgu
    vg
X-ME-Proxy: <xmx:-kjNaaNK3jkERpPwEPGUjMgCH0KBHCAbpQ3r8QmfEkQ8LYYYAaPRVg>
    <xmx:-kjNacA6bbM7stq5ZZUSI45UXXJdI6gM_y9qgSM4O3qGEXjCUx9j1Q>
    <xmx:-kjNab5baI2gEH1V-HXAf1YIBnL-EIf24n-fgRT-H2CYRf4uBN40Ew>
    <xmx:-kjNaW47BijTRpmIB2RXus-979b23403EOK4wgvoG_X126gmYKRfIg>
    <xmx:-0jNafsMUtWyZTPAMg8WsgbwKjBsU25vMSAO0VCZNNo5gQxt7PvVpQje>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 844E5700069; Wed,  1 Apr 2026 12:34:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Au-GG9YHiX1s
Date: Wed, 01 Apr 2026 18:33:41 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>
Cc: soc@kernel.org, "Rob Herring" <robh@kernel.org>,
 "Gregor Herburger" <gregor.herburger@linutronix.de>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 "Stefan Wahren" <wahrenst@gmx.net>, linux-arm-kernel@lists.infradead.org,
 "Kevin Hilman" <khilman@kernel.org>, bcm-kernel-feedback-list@broadcom.com
Message-Id: <83a52edc-1d46-4eaf-996e-924ed3a00c83@app.fastmail.com>
In-Reply-To: <3f7879d0-9e5d-4c00-a5dc-4871a049afd0@kernel.org>
References: <20260323190239.1890505-1-florian.fainelli@broadcom.com>
 <20260323190239.1890505-2-florian.fainelli@broadcom.com>
 <20260401-rapid-lyrebird-of-emphasis-da7b13@quoll>
 <2e47f487-da04-411d-bf78-4c76ac793a91@kernel.org>
 <df52b2ae-4b8b-487a-bb6b-07bf021500b5@app.fastmail.com>
 <3f7879d0-9e5d-4c00-a5dc-4871a049afd0@kernel.org>
Subject: Re: [GIT PULL 2/2] Broadcom devicetree-arm64 changes for 7.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Apr 1, 2026, at 16:47, Krzysztof Kozlowski wrote:
> On 01/04/2026 16:37, Arnd Bergmann wrote:
>> $ gpg --list-sigs 9BE46ADFE60625D891F72B8587D0969C44070704
>> pub   dsa1024/61579915B563760E 2008-09-16 [SCA] [expired: 2024-11-06]
>
> dsa1024 might be another answer... DSA1024 was deprecated by NIST in
> 2013, so maybe gnugp even drops it just like keys with too weak signatures?
>
> But another problem is that I do not see it in the `git log` of keyring
> at all which suggests it wasn't ever submitted.

Indeed, that also explains why the Broadcom tree is hosted on github
rather than git.kernel.org. While using the kernel.org hosting
is by no means a requirement, github does occasionally cause problems,
and I do get a bit annoyed when it takes ages to pull from that.

Florian, I don't know if there is a Broadcom specific policy that
requires you to use the corporate github account, but if you
are setting up a new key already, it may be a good time to
also move the hosting.

> I don't think DSA1024 can be accepted now in keyring, so this requires a
> new key, cross signed by the old one.

+1

      Arnd
