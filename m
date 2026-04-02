Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60883B47DE
	for <soc@lists.linux.dev>; Thu,  2 Apr 2026 21:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775166250; cv=none; b=pOAT4+Hn/vVxq8adoanHNDT88BdBgmMj+orAG5JCUIMFXMFJk26GCR7T7/M+S5HLAEyVjuTsBrjGXzC2BDde/FJPma4l2faUBXixsnRWRfmAynK9M0UN0pmP94bvvc+rB6B3nCv29kqvGz3tbI8Pyu1uFiuDAjo68ce7v30E/9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775166250; c=relaxed/simple;
	bh=c2REoGnOpaEdqvIeKx5TQKxbNjOmJJih8Ma0AIt4Vrc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=OArPaE0G/QNGvOPZese6UvhGLCn3X4ZoAKPBxrWUGs//hd5HMZ42w9Gqn1LnmX+1x9L8mOnB1bfGzcamG3lsoiRYF0iBxcd3G68cGZ3mOBspBg9NFh9wgR0dTnCPHog1Hn7MfDpcSUVrJ9FIh3caFCeyu2GXRdIgVNinI8D7G+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=DMmqEN9L; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FrOjsqKr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="DMmqEN9L";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FrOjsqKr"
Received: by smtp.kernel.org (Postfix)
	id 52A35C19424; Thu,  2 Apr 2026 21:44:10 +0000 (UTC)
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5609EC116C6;
	Thu,  2 Apr 2026 21:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5609EC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 420E77A017D;
	Thu,  2 Apr 2026 17:44:04 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 02 Apr 2026 17:44:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775166244;
	 x=1775252644; bh=OYQnpeSzoHqE/ynjfzXJ1D5WN7qoO0KuXUY/6t2eV9s=; b=
	DMmqEN9LJwU6m6OMVajvyXqoA3+xsORQyUIMf1jEF/XgxjoQr7xmV6LsP55wzMKg
	yiqXSJ7yC/jbS0IHzxcCr5fJbaJZcam0P7E5sdGhwDwAoRlN8BLIBTzYX0XgX18P
	8Z7bYLwV0pPOSuCy9z+IeNGMbrNvHXNsMEtDw09lI7m0bwCCZQeNcSTQjCBVKK2g
	i3QOW9ic1D7DzWIpTQ0L1mV/AabBdnm3+QCv13iIjie04U1NaCNZvQGhRlzL8Jhk
	0Nrt86Q/eE5Q5B8ypHpPVpoOxqShkupPqWv2k9vAsElj2JViUCuaylDjaSZS8ywz
	CKkzM9hqu43O2rji/P2Bgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775166244; x=
	1775252644; bh=OYQnpeSzoHqE/ynjfzXJ1D5WN7qoO0KuXUY/6t2eV9s=; b=F
	rOjsqKrBxfhkRT7+s77dBlRZ16gLlgO5KU83UuqcB14SPqMewIhADV5z13LAQT+e
	olwj9uiLpJW8Txll/Mx3j2zHOWhMWegsM2tly2syVOJtC4t3K0DvvLQkxlyK0J4B
	STu1xvsq7Ya+pMrAJhQFmWSr3dufd3kOUPVXNKYQFpPJyRTiWPdqLxBCAxcjmGHI
	Ou6iu/cuNhRA5hrz7acIwZtPxTbaOb8aNSdtA8aLiNuPN0OxKnMoTNNJCtyeGlfj
	JeOo2Qkb0oFj/flIuOO4tBwQyiLk3tphh+xmOPxna/79bPi1GOKM3L98/7jR5X91
	7UHLXXVKIVFiCxiob0dlg==
X-ME-Sender: <xms:I-POabSNu7d0vgRDjY5BYmF2CVb2Jwy5PaBcpLObJ8Z2j7fU_MZVkQ>
    <xme:I-POaXnhqVHgwuD_8hQdcLueuP99dG_5gVy9rufuttHh4jWn4RE4KdkoUysEJBphK
    Db8aYsmI3Lg0rHWXu1G51wz-mtmUS28w4MWjHDdSF6EnXO4uY0v4lB6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    ephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguse
    grrhhnuggsrdguvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepihhnohgthhhirghmrgesghhmrghilhdrtghomhdprhgtphhtthhopegtoh
    hnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhotgeskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrg
    guvggrugdrohhrghdprhgtphhtthhopehsohhphhhgoheslhhishhtshdrlhhinhhugidr
    uggvvhdprhgtphhtthhopehunhhitghorhhnpgifrghnghesohhuthhlohhokhdrtghomh
X-ME-Proxy: <xmx:I-POabT2NWajPAxYA0xneUgLH1zNW2z1dwNxUIAwfxHpIRoRGz5xTw>
    <xmx:I-POaXvhvxUoERQJMG5qRDvr_UnpPaxPORkuhtxeCFYNtzGuRRmuaQ>
    <xmx:I-POaf35szzbGLpLGzavim2sRFYZwO1afPzc-_FjJuK_IjtJLtOgXg>
    <xmx:I-POaQXDRGXbjEGsqk-uJkQDraDsX7vu68GkcbZx5FF4Sn6TNfId2Q>
    <xmx:JOPOaS0CBzvUmAUN_voBkRA9zXVJ9Amt5SNQH-kmmbvCAXokWzD_Wxo1>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B3EE7700065; Thu,  2 Apr 2026 17:44:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AaZlO9rjbYwJ
Date: Thu, 02 Apr 2026 23:43:43 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Chen Wang" <unicorn_wang@outlook.com>, soc@kernel.org
Cc: "Conor Dooley" <conor+dt@kernel.org>,
 "Inochi Amaoto" <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 linux-riscv <linux-riscv@lists.infradead.org>
Message-Id: <f99471c2-4b7e-4475-af71-5c0ac4c92809@app.fastmail.com>
In-Reply-To: 
 <MA5PR01MB1250079A8884D4F6245B955B9FE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
References: 
 <MA5PR01MB1250079A8884D4F6245B955B9FE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v7.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Apr 2, 2026, at 04:39, Chen Wang wrote:
> For CV18xx serials:
> Just a minor patch to replace the compatible for
> dma-controller to allow setting DMA channel number.
> New bindings and driver part change are picked by
> DMA subsytem and this patch handles the left dts
> part change.
>
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
>
> ----------------------------------------------------------------
> Inochi Amaoto (1):
>        riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set 
> channel number for DMA controller

Doesn't this change break backwards compatibility with
all existing kernels?

I did not take this one for now, need clarification, or
a new patch that keeps the old compatible string along
with the new one, if that is possible.

       Arnd
