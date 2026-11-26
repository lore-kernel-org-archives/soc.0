Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703774;
	b=RXnQ9sk5CFeEwMvHKStK/DE6S6ebLQEx0jl3Gylb8ImslYLAbWktzir13eogK8hDPgpC
	 dNEnoJe+7qt1X7B3TrnM8OXSHNj11or2JLJ149AslCT77sGQPCGSBfqCZ/U0+FzKEqjBX
	 f1/ldKuFsAeYXwH0a1j3O36MtgPfm7krBxrgkvkJ67tfb04/A0xx2qH5xNZPzOgJilOQ1
	 Of2mdqtciLoKDyxg3SlssJb9e752hcQhZ+T+ocdOH0Vh4fFeND8aRIuIOS2e+I/WATQXT
	 CqEcagC+3IFvsBsFq7B8rVb+gZ7lVQNS3JbLu4PNGgxpmZvAujpz9h+bEiltp+0Jafw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703774;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=v3G2V1qeOHz5K0C9JmBLTUz5Lvd66fOpWaAh9k+6NhY=;
	b=4bHEjH6DJNeJaI7qKOKWiBL/+DqGe2b0LqNpgR/4dRMykrHs+UT4ZCjWAS8Zink5EhXO
	 gRLVHhvLBC0W/z+JISwlNAU72xYozTsF/kUN3rutx6rNKL8ExQQKh0OW53CgCcSLX6K1B
	 5CpGxbFMYvodJMY2bVP/qRR1je1pxs5xoI+8Q7e6XkIj8DwD3qLq0lXYTMt6tzCJ70Ssa
	 KSpFzl+48cTcuXEmJDMwsmmVtHElkT1w8V9C66FWE/0MfEV+7jHPXKookpA1orBAAzXon
	 Q/kCPfHtMwOJTsxxXT25aMG2Mr7Eqd/n3ttNtRZUD5rUmU2bAdwXhaGwaiM+L3wKkEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=Ditwaay5;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=J5pYUIgJ;
	arc=none smtp.remote-ip=202.12.124.152
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCDC606A31C
	for <soc@lists.linux.dev>; Thu, 26 Nov 2026 14:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BCDC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=Ditwaay5;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=J5pYUIgJ
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2AD237A053E
	for <soc@lists.linux.dev>; Thu, 26 Nov 2026 09:36:12 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 26 Nov 2026 09:36:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1795703768;
	 x=1795790168; bh=v3G2V1qeOHz5K0C9JmBLTUz5Lvd66fOpWaAh9k+6NhY=; b=
	Ditwaay5qkuQhagqIDq6tPQAQ6uI2IwK+xKpPf9K85twosnIaosuc2ldBdA6k7sT
	NUpU5jw3pDujSmT8QdwQ+m74kxJYQWdwz5Ol7zl+FnJqCPNWEbSc3a/BlZsq5JnA
	eoH5Z+O6osZxYl/++u097bYKbvC8DzzYZCD9kUs16rE8p2a8Buagfa7dK+0TD8q2
	kH3wQqUwZiDWMGZkbLnx5Gyxk2WMj+S2MG9db9V7GPXIweBqm2XmCFhRbBwGSBuk
	QwjW4++kIbBaUpDmwD/WMEp7OEULlPZXDyxMbWcAE+7ZV6t6/Hra96c7QzeCatdl
	Tyrgn4MpgYoz5BA0+XPfxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795703768; x=
	1795790168; bh=v3G2V1qeOHz5K0C9JmBLTUz5Lvd66fOpWaAh9k+6NhY=; b=J
	5pYUIgJTuiD5FZgF9z81JEm9afYlAEWA+EEh2gXWNaVToPKkULyQs3XCE9zdzdqu
	XOmR6LVMd8aMEh5PYzPs1zx6fHxnb+yKBzlLaoKcr8R7IaBHuD7t4id721fdF+P0
	syDDu+9AH5C+aZeY/de4svQq0tijYCaATkkU8KzzqUKR2gjs/hYPeQ7NTPzJJMX5
	SRvObbV1A4jwvRltbexMqV6znnVQicVEh2JEc4ObpGEbFS4t+Wum8TKT0er/FKQ9
	4InhHAiRO/iZLOxNSIpWUs8kTdnJGlA6eWLzybuntZV+cbgysOCZuuvTrGj+gaWI
	P9cFKUO3UZ0VJNdZY1P1w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795703768; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+; rt=PHNvY0BsaXN0cy5saW51eC5kZXY+;
	s=fm3:rsa-sha256:i07WS1TDYhsGjie9uP3XQuayBuC3hK3LaVTicENKCpvAx3N
	cTi1+rlWGcnwJqXAemZqriqi29JM8YMtCvUZSxJNkJIWthz8mC/CsX4JV4p+scXl
	6TfMoa27WY2wPn3BdMz09ihRf85ALMgirDjGt8ulPX6bJufiEj0QrW+fhzhYqRea
	yWx9qsuP7sVsKLjBV9e1FgHxHI8RVVP40VqELxmgSZUBpXVj4//LEvEeVlYiGKua
	7naVfZOu+T6YUqCqMlZ81hACRUHBVSE81ZgyAMHvPIpuHWdq4d4nOnBLL2dCHC5f
	XNhJmwWnpAfmcyz29BoKhlW2csyqtjTaM2/AYFA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:yWFueESYeOMGYdSadhQ3A2EsfvhHKuSOdy69FlC384Q=:WxEATa8muRmovG/KC+UQpVLqlKHU82D8GbphVHvwG5E=;
X-ME-Sender: <xms:1kMIa6azwAkqvB2EwY8oyGgPfUy3SkAvQNNjHTi5XGKP5yt25TYL3A>
    <xme:1kMIa4N1CrVfpD_r35HFYzAnLpPBFts9IuYa7HVBBnAqVRp0EMVQzUhM6iwWILC1q
    xvAkMfdc2bSakiBcf-yqmN_5-4CD-SsF7AwqU_00S134rZsVOIm6inQ>
X-ME-Proxy-Cause: dmFkZTGPrzn7o2Hn0cuKZ4u1o1/gToJC7Pw01/5TZMzWjHwzXlHBIrtCGxW9RwyAJBNR0Z
    dFsHVRy4lda6gNt6BiYTzfRDQGd0LxwtQF/ZROMncKFU4Uv6QN4OgappruH93kgQZpXTPY
    KO7Bg6oR9Ha8TKXGbcWQ5gKMerTcU9+R2yEEhZZMxelK7Za6Tmcq/gya2EhOQ8Lx3xpDJY
    YdLAzCv5vaoku+HiEuJT7uLsmMLEwXCXMx8rrKh/hBUbB+FbZgoMpAryTGGtPmkrEy2ZFI
    PY7TVcW+419cPAd/fabW27BjJ7/O/wt3nfH+EjSk6saUvIp4AX+Ief30HZ+6l911u/qNQu
    tF5iEbQR6uYqF1NW5e/le7rDs8atdUWaDOfF+zTWFo2v5OWPwboJ/tgPXF/JP3BLjrhFHJ
    ebjyhkqAcP78+aIjVID7G4TP+yPswQD5bWO7tvnSZbZDQwdwM2ZbOmjI2Mq8WQrrF0aRIw
    gc7wgIRgFTSpf3jk1woD/4/gmGR3JpKgAmJ2cudNSYkpJ9F3+Ale6gIFBd/ggwD+iG5xzw
    IDqOFWiTkfvu/L+1LW38Qsahxrr12L+iQdQgNDfyh68WpCwoXd6aynsWCLcputaGBL0mc3
    jubM39xAtuVk0eYtDf/T1XDS6CUmasOOn3xnAClE3ZRirC1j0zSTt7lC4XPg
X-ME-Proxy: <xmx:10MIa7cUWOB2_tSH5_LHwvpycVa7FsyZ2tjSIggFtSWNPGcTqqfjVg>
    <xmx:10MIawQ3OgGTpJlzrUQwoOB2Is2NKOPl3ZNDd-sSl0ic1ITqVYs63w>
    <xmx:10MIa6vCc5ab142wCJp756BiqrDcxLIkuc06US9Ht0EXqElryTYsNA>
    <xmx:10MIa5eivESgNjRRUXPNNYciHQZPlnZQuTZb_AWui6e27C7zT1g3LA>
    <xmx:2EMIa0SYnfSI2HVydBPjWKQTbB9eOjQzq3NoPKIR04t74eyrM_TE0A1R>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id EFD4932A0099; Thu, 26 Nov 2026 09:36:05 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-ThreadId: ArSfj7oNcZXw
Date: Thu, 26 Nov 2026 15:35:45 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mark Brown" <broonie@kernel.org>, "Sudeep Holla" <sudeep.holla@arm.com>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>, "Rob Herring" <robh@kernel.org>,
 soc@lists.linux.dev, "Sudeep Holla" <sudeep.holla@kernel.org>
Message-Id: <2fdf159d-276d-4941-997c-a35668736a59@app.fastmail.com>
In-Reply-To: <awg_qpipeO0u8RKS@sirena.org.uk>
References: <awg_qpipeO0u8RKS@sirena.org.uk>
Subject: Re: linux-next: manual merge of the scmi tree with the arm-soc tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Nov 26, 2026, at 15:18, Mark Brown wrote:
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> [Deleted the files]

Ok, thanks! I assume there will be a few more of these until the merge window.

    Arnd
