Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC56A381E83
	for <soc@lists.linux.dev>; Tue, 11 Aug 2026 07:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786433010; cv=pass; b=QWLENxxHYDs4Vp5JoemMBqxVmehdT4n0yrVbulyeGwrcxZQCxVAK59hWm1uNzCdWzpaKJmPtnTTO78QncYaYTYrlq+azYCuCTEkYJ9IfjD2129xSm2aFukC6DwUMHC61voimKs74cC8y75zFRAoeMi990G8zrVQBYT+QmFgjuDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786433010; c=relaxed/simple;
	bh=jlhSWSIT64Q7dSG9/GEDI9KAVl5DlyKJ3Xa9MV4aa5I=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=hBDI8yS9YpZYNgYS+jSNgWTQOQSB1T22cXsDJE8+RL8edwFARKf7y+xns9uhFrnX7U6kx9lU6rkgXsn9X0rLxaPDLGVfadKyzR1XtSzoAVufRB3QtVQON3auDei47NRqtT8kWsPLyfcfcyFrJY6u7+VH80M3n2J31Yy+d5kKc5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=TWpq0Sfa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bsDJSeqg; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="TWpq0Sfa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bsDJSeqg"
Received: by smtp.kernel.org (Postfix)
	id 959261F00A3A; Tue, 11 Aug 2026 07:23:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=202.12.124.149
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786433008;
	b=h70bEFhMnOdGhxoELdDm+RUDQMB5ZSGlB7+y8eohFIY2aQ68DQEpdfM7jSPbW2NRJH0e
	 HMU4qaLBVJJjycbdVWLiSA6GEDJCFQEj2NVHivTezfoQKDIzxJJ5WYDPBJqwdbkAWl/D+
	 eef2fDyyEH1P9Ulw01lzmxn0d6X7Lz4DzVwGeDVj0gDvpDNldCk6IQlCdUY26r7DWlAF8
	 9AAoth2cJMu6WeSJBJpf+VzADDf51OITEkpXO5yFZTuOOksf4H5tVBvUiQaY01fVjBEqY
	 pzhe70txnEpwV6bz3w4glkk1AIgQ8JJm1tnSWDBDYXJ8ZMR83YCqcmoF/g8jLhId7Pw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786433008;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=mjk1ikTnqhWU2IVb1PB06tteN87IAutrfgdViA1dE/4=;
	b=3svidl9OEfKKF/HTkMSeQaX/UeNv/RwicuKcBkmGSCxtBNWLqHwoXpkgAMREgfGqkyND
	 jh6I/bwSBGfw0Lw9DhGC2ZvUiuSfCJkQiLlCr2sVgZ8Yo/yT0cmY5AvTGS6LoZXPC24Yg
	 OktEyvAtrgr17DbdYQYbTJBWJj66cinJDDyb5OA5EEGGR6jbNMpq+sJGBDlizCVh84vfU
	 08FXsaoz0P+4IwbLCET5z9/z7tZCHA5QHrOrcfBV9iQUwJ5ls6f8lAFcfzrS5Tj/VWmq3
	 n/h/LoBvUlcQRg6+uZZZPaeq/UMjeAFHjaMlPP2dK2biCA6689wg4dAE06EygGwa1dA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=TWpq0Sfa;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=bsDJSeqg;
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	arc=none smtp.remote-ip=202.12.124.149
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 46CBA1F000E9;
	Tue, 11 Aug 2026 07:23:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=TWpq0Sfa;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=bsDJSeqg
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 46CBA1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id A9FBA1D000D8;
	Tue, 11 Aug 2026 03:23:25 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 11 Aug 2026 03:23:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786433004;
	 x=1786519404; bh=mjk1ikTnqhWU2IVb1PB06tteN87IAutrfgdViA1dE/4=; b=
	TWpq0SfabNoIxXy1lRgnDnPwqKSjN6ciYcKdNAzbHxKOOuhzH7C9py8zMpMqLjHC
	rZCghu7XFkus9YFVhoijJ/LzN5VSg8/DynFzH/PaBKNcJ9EjGZz5g2E+r2HzGFj/
	aUHCrQT70Ze/os6j9vlefETUKQSDrUq5BIInxtYXUg4AMvhJc48+uXFGGEhkYHYL
	CUMDc09GsN7kN5qNknzjWjU7cwMX0m+pkwiTv8L2guHLXSmmLMRt6BrHwnWGoqVH
	3M2JOflvWn0VerYpMeU+6Xm/O4xO35y6K7VjJxliXHsWeiUiziUCGKqQ19EpRIWl
	s+OOuqipaFWERf8xHSzCAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786433004; x=
	1786519404; bh=mjk1ikTnqhWU2IVb1PB06tteN87IAutrfgdViA1dE/4=; b=b
	sDJSeqgtmOScBjCb8XTffJzBY74HjJPa63yaxvrDM/SDl004hARLyMImuj9gGgMk
	mp79fRl973A6MQMxCWvNaKIJlqeyl06ZnKTVm87lb7DvEH/GG5W5RCv+tJrCzYoe
	YlJ+DauWp2xif6U/kuhPHZhls+qkPRhAq2znTtdPDgmg5tMj5TSdwk440Qk9stBG
	gL31tVVn7FNwHSTr38E0hKC/mNLLjFyFmh7cRiFd0gpancOhWpLuuMJblVT3b30W
	1V1o0Dv02dfjTbdBMUS5NnMdW4zm1Sidl+E9gGQ//gfXneYX3nZYi6Kh4FP7Ie63
	W2iakqr69TWimHsb13ctw==
X-ME-Sender: <xms:5816amKkDndRAz58JUrGwu7g4_Qjy6e42E7XVNHWQ09qyzM8VJeetw>
    <xme:5816ao_d0jp1m-XAFrPQPpkItrlboInUtsXi6BsGWZp5IUqSq4XQVdahJ3-m51jZ4
    YVYfei1IRf5BsiyRsp8O9G3NILc3tnWZIoVc9qMqOQhfcGfsaARSJwN>
X-ME-Proxy-Cause: dmFkZTGMr3IWyAVGu6yOYpUPK0kwBRhlEsSmLXG3AuksyBgrFESHsMjP2aED5rtj92h7az
    Cr3RHlGmVxk5BagZwbxXAP+1CRh9ahw+zTGc/OZJir6gP4AFiQK9l64ifkCKAP68hS6KkA
    LggdUjwk+/iTMC3n5Cf+8qk/Lcbwkh6pRHJnWEWro+th0J8gS0+K34ZBKzLQHbwhzDRtSX
    HIYJAqAcpfVPc1XjOksFo1LplybPGLIaq3+bciz8uOIPH52SW4pOHqUsAJeoeB52xtICqa
    piO38LAQVQu+4pflBs39mYzt5qVDSwCxyiQqc+AgrUiTFo3y0od7jD+1cZsNLbg8EJ0Edc
    5d/DpDHbIWqaCMouchUeFBWmTq52SBEc/D7fP3ln5JBhMb/LImxMY1ZfCK9Bxo3kOyhM0i
    URDskWmBz7yCBk/mH5OraLJk1BGXlpkrMTbzk5JpoGZA+kRD0Bbmz8vMDwXYvMHeEATl09
    h4a2nVUzg6zOTX8Qq9jlqQW3wpDOju8+06azVi8W5A4W/LSPtTCDblndgqZls9uF5DWSHU
    kUM0W0c89jZesKg1laszHtUAx5FZJKIDU6agUcFRlARy951nW61rYL+MjR0py9vxFkjEuZ
    oiEvWVfhcTUstoxKZoav78NbSUTn+fdpx829q/QOTR12UtjOtjvt3j3enShA
X-ME-Proxy: <xmx:6c16aqLKUz-OofDzAsboJ34rn9l0jCffYIftqbzwqEWhjwBpeoDQCw>
    <xmx:6c16auLQymhYyXu7M0VioLSrj_Vp1PGJCsvskmnmK0SPrOYZzKP5FQ>
    <xmx:6c16as5MIeUAuca1hfmGzL5cVAsTnGlRuWCVDaOMpc_SNd_Y_XJPAA>
    <xmx:6c16ageoyh6KkGBNoUb4kKru7C9945kMbZNAhKXGMMNCxYRR67LItQ>
    <xmx:7M16asKRK4dCcURaDshitfwZwoTuP7YBMQlt_LFrowlP32G5eDjHsz45>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 548F232A0066; Tue, 11 Aug 2026 03:23:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: APVFqOvuG48w
Date: Tue, 11 Aug 2026 09:22:58 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 "Yixun Lan" <dlan@kernel.org>, soc@kernel.org
Cc: spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <cec87950-f0e1-49f8-9a2c-f8b87b460da2@app.fastmail.com>
In-Reply-To: <DKLRT9TOCY0W.1ZZ35K3S4Y5E7@linux.spacemit.com>
References: <20260802024052-KYC1424545@kernel.org>
 <93faefb2-5cd4-439c-a4a5-842ca5407975@app.fastmail.com>
 <DKLRT9TOCY0W.1ZZ35K3S4Y5E7@linux.spacemit.com>
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v7.3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Aug 11, 2026, at 04:49, Troy Mitchell wrote:
> On Tue Aug 11, 2026 at 12:45 AM +08, Arnd Bergmann wrote:
>> On Sun, Aug 2, 2026, at 04:42, Yixun Lan wrote:
>>
>>> Troy Mitchell (1):
>>>       riscv: dts: spacemit: k3: add i2s0-i2s5 nodes
>>
>> This commit caused a build failure, so I reverted it for the 7.3
>> merge window:
>>
>>     Lexical error: ../arch/riscv/boot/dts/spacemit/k3.dtsi:1181.20-39 Unexpected 'CLK_MPMU_I2S_SYSCLK'
>>
>> Please make sure that each pull request you send is free of
>> build failures and warnings and works on its own.
>>
>
> The missing macro has been merged here [1].
>
> Link: 
> https://lore.kernel.org/all/20260717-k3-clk-fix-i2s-v1-1-e95001a692ee@linux.spacemit.com/ 
> [1]

Right, the problem was that your patch to use the macro was
applied on a different branch that caused the build to
fail. Yixun Lan should have caught this problem and rejected
your patch before sending the pull request when doing
a 'make dtbs_check'.

This is a common problem with unstructured SoC devices:
If you can't just use the number from a datasheet, you
have to wait until the binding has been agreed and merged.

Earlier in the cycle this could have been resolved by
ensuring the binding change is used as the base for both
the clk driver and the dts branch, but now you'll have
to wait until after -rc1 is out to resend.

     Arnd
