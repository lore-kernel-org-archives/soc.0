Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744E63D6CDE
	for <soc@lists.linux.dev>; Wed, 18 Mar 2026 12:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837607; cv=none; b=Jtt/EGxJbWFWOtGymOsQBqFqy1km+4wcnXnTLvCdaf7+HKEmZ5FTztPg6cc8UcXz0tb+L5Gl1ZKKl43d7K9ZMiSwHuWF0LvAXc3lGH3o+UEkJv0FDMh3EIO86Yk0oehnkrOPpQ52crbP7s2rzsJS5lObif5UShDdZUG0uz7/BkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837607; c=relaxed/simple;
	bh=i/1jwDk0sovQQuJUSKLnpcR1rx3CYYzEU0IxDZZb48Q=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=TTl/o1woYYN2IWZ5xtcLhW2NRingiWm2iXJFTCwdhxy5ZH6/VBugFbnGW05k6AdrRIB8dxpPGY6+idKEvJs1b8JnG8uTOgcH4IYctH3yBSk+81rmYDnXEgNQPWwZ+YEIolFt8dDyx74gsVtWps6BOhzyKSYBjwWKcctIBIvy3Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=tjlZ4MWe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fVCS1m1q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="tjlZ4MWe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fVCS1m1q"
Received: by smtp.kernel.org (Postfix)
	id 2FBE2C2BCAF; Wed, 18 Mar 2026 12:40:07 +0000 (UTC)
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B7925C2BC87;
	Wed, 18 Mar 2026 12:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B7925C2BC87
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 691191400227;
	Wed, 18 Mar 2026 08:40:03 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 18 Mar 2026 08:40:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773837603;
	 x=1773924003; bh=cMsP1ViDg5+W4pJB6stHHF7Nl0q4BrWqMobLx0PpOAk=; b=
	tjlZ4MWe9PaM979xGZvpvNsGyZ/AcWs0oRo5lCY0nNNZTObdfy2AIUokOCi4GAxW
	H6MOK50dkD+vRbRimLBrlAP5uKx7W1rp+1HKHnpM4dwWzolLutF3/uCegCEp4VVM
	a5M+oD2hxc0TTSm6i3toB8nD+PcnZacwHbnFzXYUeXCVbPYBzv56vuRXbnSYXlhM
	wg+WWG0pKJnKOEbxRM5I2Im3D1DGBWU9Vfl0pK9FC5EjrhHWUFif1P8hHiDzadg9
	boCkEygOIt+Sr2IwEMR/358IY6XXeiPu5gRcR6s/I1FEVqkvR728p9AHJQIQaU36
	noJBkbDUkndEWQ49jXJqJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773837603; x=
	1773924003; bh=cMsP1ViDg5+W4pJB6stHHF7Nl0q4BrWqMobLx0PpOAk=; b=f
	VCS1m1qtsMUmrQTaAcRDredHvUIGbCx5+Gsbjj3mrTtLxqwEeA+3mt6LIwarVfeZ
	xEf0Ocb3D3pUo7pDCAZ+Wv4fTE3phDx5xf+sxTp5cYcqX9jxuDRJlarP5oNCSm5b
	TfJgMam/vEdrfaxoZXtFa9wQmazap6eVepyGUO8HnO87TN7DE3Ancth9/+hNHSnE
	m1/5g/9oyGh/ju1mBlzkIrKWFgpsajSHGHbZ+FN0I/J/ZIrfIhOUJa+eiet5s4GL
	El4jOFf4aLUy9GSGunJU+lYtDzNWNpvW978BxjdzZf0W/2RTMA3O+3UK0jyRa67s
	mVT6Z4/easmFiJW/wy9Ww==
X-ME-Sender: <xms:I526aUZoKAr2ABc8Bxq6p-V-WeNALCsnCskTLGNQeGNmJybXXzftaA>
    <xme:I526aaMd-lBZV4M7fUmyzKYEAyntinqC62SRHWUNdAmRz_DTCkZ_AFtplEGsP0xKJ
    9Cf2sMZ_kTj-eEqn8iNNoDL2p9k35EaQMPiNOgLF8S4TrpWPeBQc-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdegudehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhope
    grrhhmsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhumh
    hithdrghgrrhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjvghnshdrfihikhhl
    rghnuggvrheslhhinhgrrhhordhorhhgpdhrtghpthhtohepohhpqdhtvggvsehlihhsth
    hsrdhtrhhushhtvggufhhirhhmfigrrhgvrdhorhhgpdhrtghpthhtohepmhdrfhgvlhhs
    tghhsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehlihhnuhigqdhkvghrnh
    gvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:I526afrMwZuND3ODxHRPsRascj4bUDDvq8TAE6I1mfmg-dPE2LgTnQ>
    <xmx:I526aaGYxkPrEBwQfcbCGFahSc6_62DYojymnYBpddGE-s3jsq7Bjw>
    <xmx:I526ac6eImRoTkQwCKpbaF_DS_elu1kcH2MkehticNzO248xGMfvEQ>
    <xmx:I526aaeYHj9TzXIm5QQfV1iFH9_tL7v1I1EHBsgOtVC0uO_VkKst8A>
    <xmx:I526aRhtQBjnMD8dbafW_JKe82g3aF5s8m2gPD8jY7mKzCZI0rE8lbIg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E93D0700065; Wed, 18 Mar 2026 08:40:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AeiqtKTVlxuV
Date: Wed, 18 Mar 2026 13:39:41 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Marco Felsch" <m.felsch@pengutronix.de>,
 "Jens Wiklander" <jens.wiklander@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Sumit Garg" <sumit.garg@kernel.org>, "Matthew Wilcox" <willy@infradead.org>,
 arm <arm@kernel.org>, soc@kernel.org, linux-kernel@vger.kernel.org,
 op-tee@lists.trustedfirmware.org
Message-Id: <c3f1a10d-8437-4d17-8dfc-286935ba9e51@app.fastmail.com>
In-Reply-To: 
 <dfidrflp5p637dqnn2e6sqr6gbp47gimjlkechjjtlbr7re2e4@kgwofxcumhes>
References: <20260316074150.GA2474723@rayden>
 <20260317-illustrious-finicky-frog-90a86c@quoll>
 <CAHUa44HXjrPbPv0sBxzrW6o1iQVWdp2p-1-jroukZ8dxSvPmMg@mail.gmail.com>
 <dfidrflp5p637dqnn2e6sqr6gbp47gimjlkechjjtlbr7re2e4@kgwofxcumhes>
Subject: Re: [GIT PULL] TEE shared memory fix for 7.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Mar 17, 2026, at 13:53, Marco Felsch wrote:
> On 26-03-17, Jens Wiklander wrote:
>> 
>> I'm under the impression that it is a fix rather than an improvement.
>> However, since it has been stewing for a while, it's clearly not
>> urgent. I don't have anything specific on the bug fix, other than that
>> we're supposed to stop taking those refcounts. Perhaps Sumit, Marco,
>> or Matthew can add something?
>
> It's a long outstanding fix regarding memory page management. The
> userspace gets informed about this memory API misuse via a warning print
> incl. a backtrace. This gets triggered only if userspace uses OP-TEE
> trusted-keys or the OP-TEE EFI variables. Therefore I would like to get
> it into 7.0 but 7.1 fine too.

Yes, that is clearly a bugfix. I think we'd also want this to be
marked 'Cc: stable@vger.kernel.org' as it should also apply
to 6.18-LTS and 6.19. Greg tends to also pick up bugfixes that
don't have this, but it's generally better to be explicit here,
especially when it's not obvious what the impact of the fix is.

I've merge the pull request now. If you think this should be
in 6.18-lts and Greg doesn't pick it up by himself, maybe
let him know about it.

      Arnd
