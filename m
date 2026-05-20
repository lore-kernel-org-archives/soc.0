Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E05A345CAB
	for <soc@lists.linux.dev>; Wed, 20 May 2026 19:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779305405; cv=none; b=RRAJPbuAz7gaBqioFEvhhsfem3PQ3uISbPceRrCvJuik1yIL3SbI1pYMPYkoByNt4tYJziJLnKKBv++Xiv+KuQJmx7z68Vhti6ig+ZwnilZ8uFavVKwKUGAEGe9CwjBRWWNXKGjkPh0lu81+UoxpJjuT3SXwqRZfALnflJMuOoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779305405; c=relaxed/simple;
	bh=pbvhbvrKFr45Cc/sk5lFWSIUdK5ElwmozXH+03tHiek=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=TwE7aZUt6mGxp7/ctvgFppSz6/cAp6E9fC7fHNUvDxArYUiIdbOPorSWF1Q/jTYP/HCuiHjAUkKGTiib18qVPrymObi1iiqeMlaD9OuOaLOjiUMvbUGd5EeOTZ9QWwgSluGHaDkR+z/v/+BdnbdngEPObV8ft06pIZJtvB0ArWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=yLVknNot; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SyydZiyP; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="yLVknNot";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SyydZiyP"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 517E17A004F;
	Wed, 20 May 2026 15:30:00 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 20 May 2026 15:30:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1779305400;
	 x=1779391800; bh=1vj+BLZgbVV3WMYMjl1c288vqStGujet+k8MZmp/QNI=; b=
	yLVknNotaF9FIC+FSbdHoCcEBcqFpo0uHPb5GRiaJifCU7Q1ti+lRSqo33exzcTE
	skxNy/OVtePeciXup+GaqhFlN71YQObIjLV4S4O3bh+xFtXRJgNZyTJjsXEZRc7Y
	Vs3czse8CL1M4rX00tvFaof/+1CS/TMRLfM6P39RyYbhm4RPyliLwy6z0CFW33Mc
	zOjsTY94sbpUXC9NKV3oIadlnS3hdBJdm22ypaSew3QQS4IN+W+X39D0uGjXchL1
	RUEZ0SugpCEm8OwXlsYuK5XBW9Kyjp39X8VP1NOmuj9hQCcIV5TLCQ4laXpKB+Ew
	5OeheCUP4UIm1m2nRnnmnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779305400; x=
	1779391800; bh=1vj+BLZgbVV3WMYMjl1c288vqStGujet+k8MZmp/QNI=; b=S
	yydZiyP7uJeQvz7HRUqy08SKY2sWsjj7QwWwZb+wCTl4OrxRTuicQMEVR4Q/9va6
	JWVr3MotPPCNa1Dmn/yHpNGMT/0HwJuZxc+C847nijbMuZZ6xgrII1hjwN+v9QZ0
	Ig8GhEUyitq5Pi5zvaB1tPot7Us8h30X3nRabQoMKtrSRnyjz36DhCZs205AqCUJ
	3IiCzAAsYdKj/7jBg7dLGubYUnwOU1CeDHpiTTo8uIxyTGM/rw1E+BLaOaYMonru
	6ifTa7pn5BzN7104HN0zJF3Miay18XtfZFyDK06cM4d+t/IhhqMHpFMmHjNpjE0V
	eEXIR/bHrpKI8nHmjl1jQ==
X-ME-Sender: <xms:twsOavo8s9XFYOI2pXNELDGuKgdr3DYNx1K-R6ZdB46fZ9iG1CwDLA>
    <xme:twsOakdmIORJgwbzwYxS-5CF5wsuAWRSR10hiMuzA2RtcgJJJRy5KcmsGRaEQbHRd
    8lxe7Ua2IyEtQd-otPGas1aslNJuwfYUPuAxMzAia65VN7K-KASA-5M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeehgeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefoggffhffvvefkjghfufgtgfesthhqre
    dtredtjeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghr
    nhgusgdruggvqeenucggtffrrghtthgvrhhnpeekvdeuhfeitdeuieejvedtieeijeefle
    evffefleekieetjeffvdekgfetuefhgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhg
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepshhtvghfrghnughovghsihhnghgvrhesghhmrghilhdrtghomhdprh
    gtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrggu
    vggrugdrohhrghdprhgtphhtthhopehsohgtsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:twsOatND2Lcn6LVTXZ_YLsTnJD6Qft97VRmN-1afNJwwG5pvFNfcWA>
    <xmx:twsOagH0GR861gSstSZzXpJz84exK-_6NQje54iIxL3e1RVJLoguOA>
    <xmx:twsOakPUBMxTEdhgr-a0SPbjTBXb7cI7uimYrUha_z9JdjFnzm0XeQ>
    <xmx:twsOah9TtV-mCKOYT7jbDF2ym914a4KJaBq_MxkU2bAoqfjX9pa4Eg>
    <xmx:uAsOajwfVfyffC7_gG1JkQRZhptZFHnpUOVxc8Hyj-nIsYGRN4yps2Mh>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 75C91182007A; Wed, 20 May 2026 15:29:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AZY3I4YnR5H7
Date: Wed, 20 May 2026 21:29:38 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>,
 soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Message-Id: <ec2f3c23-1c1e-4267-a83a-c9389246798f@app.fastmail.com>
In-Reply-To: <4560997.ejJDZkT8p0@strix>
References: <4560997.ejJDZkT8p0@strix>
Subject: Re: [GIT PULL] arm: zte: defconfig: zx297520v3 defconfig for 7.2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026, at 23:21, Stefan D=C3=B6singer wrote:
>
> This final pull request adds a defconfig file for zx297520v3 boards.=20
> The rationale behind the defconfig is that this board is too=20
> underpowered for multi_v7_defconfig and quite odd - it is a Cortex A53=20
> without an FPU running in 32 bit mode.

I've merged the other two pull requests, but left this one as I noticed
that you missed my comments from

https://lore.kernel.org/all/61452117-0cdc-4ec2-83eb-dc03ccbd410b@app.fas=
tmail.com/

Please update the defconfig and post that for review again.

     Arnd
