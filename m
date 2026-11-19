Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795078727;
	b=ozuqW+0gzPDsEApohxIhBqIBeNG6Xafm42BHdLRs1FkUJ2knHqs7sQIb2BpY58wf8TjO
	 A/dUXnOWvaZH1c6ACkGGWRc9QmWtxEpOLWgoFmA2yxEJXTCnvV576JjedbxXfFd/W6UXV
	 nfS0n5/huCU4d3wb4T/oUcu+fDr8tdzaNk0er3CxwT7ItDK2NM7wtcVuMB4gclHt438bw
	 6w7smMRnwJdKirQaQhELhHqqs6wyrFjVpnsNrB5RoG6Ejk7om3DYdmGCxDJUSaUNcndjh
	 /TFJTZvzJFBqCSX1Wxcv6E6PHdc5WhXpsbZ9nQk6H9J9ebctPIly79TQmFgqE3zxPXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078727;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:Received:
	 DKIM-Signature:DKIM-Signature:X-DKIM2-Info:DKIM2-Signature:
	 X-DKIM2-Info:Message-Instance:X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:
	 Feedback-ID:Received:X-Mailer:MIME-Version:X-ThreadId:Date:From:To:Cc:
	 Message-Id:In-Reply-To:References:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=lwlbTkMPnCI11I1GYQjW0NZFRrpmfZxueJSODj5a/os=;
	b=Sk/ZmeVA1p/k2/VmxOE5EyAzfmXkoExhx2hjaur4VqSf4rWNIETdxxT6aPfAzN2hnUIz
	 ZiHGsAruBqe2Z02iUjAKM2evV5NeJJhdbHt8O/s/HbaiNmYv/1dwVaHRtMKq3YWepT5BM
	 7wAlv7H3BZAa+YfId3CjoqXyw+PDNjZZgZojGyHQyjY0dI5q5itbtJUzooySYNn8tLEKP
	 LtxUllu66xRsA3/PTmXHK947ASFBRtHLBZFO+oEh7oCbW5HqHzqyBflP4JzXPx4CanW4z
	 +4MXJo4h+8rCZZKVrPzCj2OO8XJ3U8f3uXgtVqDh2fQJuuyuJKzKwdxIrwBUf6Vgy+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=l7Rbog57;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=4zSlQmV5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7A3606A320
	for <soc@lists.linux.dev>; Thu, 19 Nov 2026 08:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=l7Rbog57;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=4zSlQmV5
Received: by smtp.kernel.org (Postfix)
	id A1E4E1F000C4; Thu, 19 Nov 2026 08:58:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=202.12.124.157
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795078726;
	b=g4Gj1xKCPgE5wykmIJzE3n6KXETBXALIJlpT40DCDwp17nJqaBOlEWr7/RPXmDmUD12L
	 +FNW1I9zAEOb/dxoINeAS7mBW1y2vwPLS2g4cfpXZ9jck3o3NKIf2Ko1MF2wWcoViMnfv
	 h9r+tRkDktPpBol2JGaCGo3QB5ukHBJ2EKnGc63fIxua8UubvwaasygT2U1T2oW8Z+nEQ
	 cW1cG5LmTgmPvhg7AKfpsUGrGYPF9CVLA2wfsYPSLr+vcLZj6H0Kh9yNC7BadWQhHi+wQ
	 ciG0OPPhjxC62Sbv2I2JU4aOXN+Q2gxqCliPW8Z7vYvMcFwNGuXhnEvg7vO90XPj01A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795078726;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=lwlbTkMPnCI11I1GYQjW0NZFRrpmfZxueJSODj5a/os=;
	b=AXLJcwC7jt4tBkZcqwWd5Qj33rAYxvcCsXw05fo3INGLsVyqcdMClkSVEHLutG66f61S
	 va2wDBFIpaUcryZri4cXfFteK0naa4PBI5fm81G8KDrysoy61/tXsKrd2Fx8uFi6YXP83
	 CqX4sAtfZbNYb5OjBV59un7iMHUDACnowi3KEKjXDb8XGsKuSGe096coTbLA3f+ISHhvf
	 2eO2OUv2G5+1i0s2SToAbwq93wJYSNQAMIxjUfn5OxOYdh7TKOiioEif7wR/+EubFIdJn
	 8L3SaeGdRlo6SSdHK4Re3Yr+HLXHP9TduiaAAQ5MbFrVkmNvK1eeHiIajzOUj95kqYg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=l7Rbog57;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=4zSlQmV5;
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	arc=none smtp.remote-ip=202.12.124.157
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 163D31F000C5
	for <soc@kernel.org>; Thu, 19 Nov 2026 08:58:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=l7Rbog57;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=4zSlQmV5
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 163D31F000C5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 676657A02C6
	for <soc@kernel.org>; Thu, 19 Nov 2026 03:58:45 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 19 Nov 2026 03:58:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795078723;
	 x=1795165123; bh=lwlbTkMPnCI11I1GYQjW0NZFRrpmfZxueJSODj5a/os=; b=
	l7Rbog57Vw7k0YUoDhcKxh+EqBZQRDiwDJY47qlb9tSbQSvp24SIu+1Ws8u5VHv+
	oHxnPq2PY7nFt/KNbYExeMddYWItKMmvVZJFActWb5FjfWxLkAXeAbHPevtTbqij
	bPF8IaxKkytA7WoZhQotMG8U/5U3LNfNrThfA1B5ZPN5yF/vuacCzmiM/X/tlWFN
	N8yUyP0gZ1/JgxpjWVSdRGUk5WbsFRXU9SjqdmgdNWoSgiq5YhCbknqh3RF+037S
	y8fmONPWNrNs+6Y3xllCfcuzaf6h3MkHd1Qmv/1rk7G1UIvlwiQruIzH9NlAiaGw
	EoYf1YeBKo+5gtd5JHtmCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795078723; x=
	1795165123; bh=lwlbTkMPnCI11I1GYQjW0NZFRrpmfZxueJSODj5a/os=; b=4
	zSlQmV5e/9XR6xHudo1zlL7MxjN9cn09tj/JwPyES4J+1I9Ttd0+jKZ19BJhPA+a
	wruqK+VPt88vcwFrQzL5+VXlB1UXgfYG4oPENSWjyKZoSy9lZHnub7Z+nvqQ8/Wz
	Gr/OQqPQSt9GVhMX5HFegGZ8DjflcT3kVGr6LgLmUOVgNfO/xPcK1cbwre5nRWE/
	TQeHt1hdB75h2Jr4KZiIb1juGMCC5bziXNaoNBH84NpcU9zboQ4MkZrVGb7sCR+n
	x6/VyTWQZULhKP765PXorYAspbV5YzC5tDHBaK1lsYzfXd9m2gPlXQblhn2Q76LO
	7mNMMMM5X+kbWPCVVIlkA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795078723; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+; rt=PHNvY0BrZXJuZWwub3JnPg==;
	s=fm2:rsa-sha256:hPNNO/RNoQj3QKorUH3uMov7gIyWD7MIoppgk9xT+rYdZmH
	iFbkotVoNORJ7rhXIeJJt+XQTPpOJXOR6hBX1CCzSdWEULDzySzFSeQAPmIW3QmI
	lNEFV2sGcD8G9Uny66fla2jyRScPdDtNjwbYdW2R/xJVNKgelrLi9G6SJMsDhpiq
	kvaq8gx+KSYqHA4WoStid00ldWQe9NdSwvh+l/wXr+4HxW58KTiFFGIFP5OdRFaz
	ztnnQNMQn4ABf1xaimcg9GYkHhsDlZs4lXuPx4H0wlkjQBuyraR7+4l1ERaVuWaS
	ee1xrYNV6GIQXwAvCZldCQ1NMWH/JeSo6HSEy7g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:LJbZ0gn6RXYmljsTdUYMj+jjLXVAUy28HgixDBVDR70=:0xLl/dh1h5zAlN0LYDM9n5BeMS9bFUnQ46DD+dAnNtA=;
X-ME-Sender: <xms:Qbr-aiOHmlEqi3aXi3u2OEeFnGtBpVHZttvl_p097iirGj4aGWvckw>
    <xme:Qbr-arzPB16R38qZmUFHjCheDqIFYofDM-fFgOhnXKII2zJiCTahP0zIWuDKy3WuY
    nF-d2ggCbIz-vlyBfZF0KZzn_BObUpKbc2k2UriDdb6Fl7T4WstyXuK>
X-ME-Proxy-Cause: dmFkZTF4PzICJHkMLknF/Gt4FcNaIfqS4xJjsEUaqhWVoE9PnRocRpcF+r1KHPGC6yvwn2
    Bnr9RlxZs0UPI/isszZRfXPHX6tMkZlyKidhCOSduYqTq0Wv8s4FLCg/tZyxgKYQgbSP01
    c6vZbcCZOIdtfg+roWVqf/YDV4QV+faRHFK+6puvLK632CQESGkEg1oaBgk2R7Gi5cDTNE
    +tjuVBcwfZ4SpbEa9V5t0bK7eiSzNnz/7EBK7MZYXBiCVKMk42nf0ChWDfMdi/upnQHycJ
    QLfP51snVjwwlWakMwlHTqFUdo70L6zFgjJHQNtNrVw56eGmrMDSM5cPWrb+WWlvujfyV5
    BV6x0XzdCHkMbah8gofHy/nIqkAySMSLJ3KhwIBja2+A2JZLsWCaObVsn9FQSzkHODGd3b
    jPcW9Mhpbt0cp1s6k89zHcCZla0I7q+J3AsgkgWo/PAQAHke15t+dGBmBvJdZpLVkR1j0o
    PtMxxYQQ4yP1mZwonZHIcAngRB7Eqapf9FuSGN3xnWckSPkc8RkCx6OwSdrOOi2NI205Ly
    SSH0t7EFnSHeQPK0mmMbZ8OI1e6JDEZLBe6OQPGCTaPcvzZHw/AemjRoWPnqNZ5ha/oem0
    hHuhf60VDEWF/DYDIpjdXPKLWPwsXlEGBI6b7PJqJTL0g4qAWWW68fECttrA
X-ME-Proxy: <xmx:Qrr-ah321sBuDLBDfMLrQFuYiVBUXaE6S7b0PrwrC5T8SsSTJY1VGA>
    <xmx:Qrr-al7mgB4FWhnznTib_ACNJMsKzecuoycoey59OvaI6KGTZZ0Wiw>
    <xmx:Qrr-asW_w1uBrFNqT2E6R44LnttRWufIPdV9-1Xy41e8Z8aLnCEb_Q>
    <xmx:Qrr-asDy1d5yY193kFbum7VTNr25Ru3WBboeLVYqvQjXCKndnLI2dw>
    <xmx:Q7r-apPXBQygjKwMFBdqdGWG87FOLA7LHA64lt5ihYAjYKQxdjSfQuVd>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 1EDEE32A0099; Thu, 19 Nov 2026 03:58:41 -0500 (EST)
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
X-ThreadId: A98ktjbAtJSN
Date: Thu, 19 Nov 2026 09:57:35 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Tzu-Hao Wei" <twei@axiado.com>, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: "Mark Brown" <broonie@kernel.org>
Message-Id: <3b494499-c8e4-4670-8d61-b770d2298331@app.fastmail.com>
In-Reply-To: <2b550966-0185-47bd-80bb-ebab6f717e2c@axiado.com>
References: <20261028193648.73841-1-twei@axiado.com>
 <2b550966-0185-47bd-80bb-ebab6f717e2c@axiado.com>
Subject: Re: [GIT PULL] Axiado DT updates for v7.4
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 10, 2026, at 19:24, Tzu-Hao Wei wrote:
> On 10/29/2026 3:36 AM, Tzu-Hao Wei wrote:
>> 
>> Hi SoC maintainers,
>> 
>> Please pull the following Axiado Devicetree updates for v7.4.
>> 
>> This pull request includes:
>>    Initial Devicetree support for the AX3005 SoC and evaluation board.
>>    AX3005 EVK compatible string in the Axiado board binding.
>>    Minor hexadecimal formatting cleanup in the AX3000 Devicetree.
>
> Just following up on the Axiado DT pull request.
>
> Could you please let me know if there are any concerns with the pull
> request, or if these changes should be deferred to the next merge window?

Sorry for the delay in replying, I just got back to merging content
for the next release.

Your pull request came in at the wrong time for 7.4, we really
need to have everything queued up well in advance of the merge window
to ensure it's properly tested, please see
Documentation/process/maintainer-soc.rst for the usual rules.

As the contents of your pull request look fine, we could either
pull it in for 7.5 now, or you can rebase it on top of v7.4-rc1
and send an updated pull request.

A few more things I noticed:

 - you have signed the pull request, but I can't find your
   signing key on the usual gpg servers. Please upload the
   key you used and let us know about it.

 - The contents you send should be in Linux-next for a while
   before you send a PR. Please email Mark Brown (on Cc here)
   with the details of which branch you want him to include
   in future linux-next builds.

 - As a maintainer, you can apply for a kernel.org account
   and host your trees on git.kernel.org, which we generally
   prefer over github, see
   https://korg.docs.kernel.org/accounts.html for how to
   apply.

      Arnd
