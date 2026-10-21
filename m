Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792601226;
	b=SX0j2aHqMxGMBA+tuWfmLfoR8bebDbfMFzRcA75DLWYDcl9dsmmd+oK1qVnpHhm770Ic
	 NvnBiiMm9uRZPjdMfrdrf51RaHW/8YyHVomLUKXDcHTKhFYHWDYspdZSlD2j+PQ+tG8os
	 Uil5NfkMZCmWCGQEA//TszFIZxQTsw4ryVEzqVtB2Iypsw10ksiChvpN7Nzc68Ebiu//4
	 K7J6UTjeDucw/h/I8M2HVA2MzbbqQk9oT3QUpLpnGCHsyG1Fg7swGDBhZwEXJbJ+jDi9m
	 nzRBm9GtOccseaNQuTkThLoe/xV+SvkTUD+YU0DYlxkdTiKW6EQaHpEm0ZfNvU611Kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601226;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:Received:
	 DKIM-Signature:DKIM-Signature:X-DKIM2-Info:DKIM2-Signature:
	 X-DKIM2-Info:Message-Instance:X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:
	 Feedback-ID:Received:X-Mailer:MIME-Version:X-ThreadId:Date:From:To:Cc:
	 Message-Id:In-Reply-To:References:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=8kEkb6DZ3cwN7N9H+5f3LRJFrTX5ppA7+SN9XdakmPQ=;
	b=2f2glKBr2xn2zbnMfWAU/QRNAo11d/BvAJTHnD/t2wWiEDDAdaMR2bt56OpRoqURR8Jy
	 i25EXucGIV+6p4tKdgHCyFxXnhwTAy9zcPRuBYSB0RzmvkzWbeLF5ybf6/cDtVun5lfqZ
	 AK0M325qmz0watLINx1bGJCVskJZ5Qxnwm3rLcsSJZ8jfrcix46M32hbGBePmfa5rRWVC
	 cyplyJCmt8ReE1LlKGJdzyeNzoLq6s1BOE9cRLt/HFKCrrjo3Lj1U3B7zB06zaFWpcRNS
	 3eEvghzmHC5lMJqsTYwW4pkVM1fGSCprQVqZxqCg3XEyRrImOzATUfGO8uAVYyknmbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=XqSjKWBE;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ZM12VG47;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0714606A31A
	for <soc@lists.linux.dev>; Wed, 21 Oct 2026 16:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=XqSjKWBE;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ZM12VG47
Received: by smtp.kernel.org (Postfix)
	id 76E251F000C3; Wed, 21 Oct 2026 16:47:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=103.168.172.157
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792601225;
	b=TRy3+lhdhT6P/Q8pEECgRbUQSQB7xQzsf1Z+ZAUMRtDEhZxSnfDwHjaifpg7W2dE/Isb
	 JGdwEGnSKZrHEFX/0EECi1Am0ty6hQyVi4Y48ruNFiRLXrYzZUwUHo6ZcAfowDsKusHr0
	 T9WKwuMX/CBOARtFjssuPIC6QMMaXxhShjPD8lmrkN19SUfgAxXGRMSxfZ/54x6RNW5Ox
	 /6/ze/uctx7NuHzCSTV1POdLPqqz4E1N5LLoh/pxB9igRst3lYMgF5lRzNVMEEn9CnVbR
	 P1U6J3chUFE6PRMNh2tQTrxgd+oKNQo7VNBvuJS5mSRoV42AemN3wMbEOEdIgWN+rgw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792601225;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=8kEkb6DZ3cwN7N9H+5f3LRJFrTX5ppA7+SN9XdakmPQ=;
	b=YS68KQRytOqmfrVuPAZrQXLBbWQ8x4Rr23i2oFFY3SsWeCILJQaz5W9pTdQbQRdR1zo6
	 xOaakaXjhAVaQerG0ilg4ny5mOOJwD4SJyMmlgLhy6Ik2I7k/bGJd2xox/euLiliv5UPX
	 rem82UnbMd6x3x4NuYJd8Ze0RTkwm/bNXHfC7wJZqlG2xitP1IkpgL5ENTajGJnvkGq3m
	 CjLaEfsNTaYi9zDDuNJ6WHRfYW0DlcoCzCoqPIUEmDy9WqsUswkNAD6WCNJLiI67pryKy
	 n+sLQmNqZg2wBwnacG911WyIg+uoqeSKXXnlqhnFk+4yxZalkjdINaiT00unaIaPKUQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=XqSjKWBE;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ZM12VG47;
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	arc=none smtp.remote-ip=103.168.172.157
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 656C31F000C2
	for <soc@kernel.org>; Wed, 21 Oct 2026 16:47:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=XqSjKWBE;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ZM12VG47
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 656C31F000C2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 94F651400178
	for <soc@kernel.org>; Wed, 21 Oct 2026 12:47:03 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 21 Oct 2026 12:47:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792601222;
	 x=1792687622; bh=8kEkb6DZ3cwN7N9H+5f3LRJFrTX5ppA7+SN9XdakmPQ=; b=
	XqSjKWBEaZ8jQb+ig43Vs60l8toUiRMjVGgJGf+Hl0mdkVjGVPPpBxkXiXb/qEWI
	ccE6h3TnXr56NPlp12uKCwx2Ygc+4LyMOyeFV2+Su0xyOvU1JoN3PeSGrts2tp5J
	zBCOQ1FkyVPwOSSe8ruechai6NOq21wJGkxI/M/GdjsyVp0m3rSUeivSBCtCCJA4
	zo3N19Y9JSyG1PKdgxiMYrm+th0VjVA5g4zGnNDqzwcHN/KO0miNEcMc2Fw3MtGs
	ZxUWiIlw3mUdjZjhQNMRDt/VkWKmNZgZz1vdXkwAakKYdMPKFJGdXO6gFANUV9k8
	1oq/kN5bPql6EuijNARtDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792601222; x=
	1792687622; bh=8kEkb6DZ3cwN7N9H+5f3LRJFrTX5ppA7+SN9XdakmPQ=; b=Z
	M12VG47d4ky3fys622ED/3DAx2UGDITMNXZyY5PVUOg3OJOvZiBSP671z+zMjCg9
	9VNlAfojMzM1+y5iL8Psid13jg6KVt4FjCL1Vkq0LkBksQK0meBti4OvqvT861RP
	eIdXKCzXmM+g1hEJCv2yShYD5W4JVCmNF7Qeu8wAL6n/BVGyme4wuFsGu+3SZKeB
	GkHo+9f2oBBW/witWE38w/u99DugxpeSKjiGcXR1lyUjX8U53PZe3HlJrWwscniL
	qMMLt/CzPgxljZ8YOiDdBvUO/Bh1pSGqBooGT+zBF66S5Z4Pq+F3yA83jhldtMjR
	FuD1XYw4/TG7sJvn1360A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792601222; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+; rt=PHNvY0BrZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:MX2gZ6K7nnb2LgqFr4DqbP1yp2obtjDbrjv9TEhVjxdEa9u
	Eu4dxlF85EjaGKTrTuWulncJ/yaFhzwwRU2HMLbQOVUV6Yf6xtNhc7fn023Asu/s
	uXO5iA8hxDbHR+yb7+MtC2DhenjKjp6Ieyo7laMVSEuTCrKaDNf6r/rVZGJ4wLdr
	d4e/uANHF5RmI97QvLWqyehgplKxZYCeirtY0jTfb3jwEIhVqkHkJ2v2XJcHWdwp
	pP52k8fiHXqRGBO9yYs4zYfvkrNy6DcGqGQCJJ+XrNZ1nTn/vengil/bi4m/XK/8
	697eIBxib6ngEqddv9JSKL2l3QuxNZyon/P+Xrg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:hqS6KGaLPDtYBb+72RIg/nXfoZMTZlpHjBWBdovddZY=:ePL3IlEIYTxMXdacV0J16Xl80fCl64wKG0e4/LsjStc=;
X-ME-Sender: <xms:hOzYakVuBlraVca2EhVast9E1okoK3MiHoNPoBwfAu1vAMKh0UbEng>
    <xme:hOzYajbF-XRJ2VeF8BuU56BXor8Ov62WNQEs0CodHfsCfY0QrrF9WbUPBqyAIOqv5
    1A25fsTIQLlmvHpoIN3jGtlI3gUfddJtZ-LTMZAz9I_Mt9v2-g_J7BX>
X-ME-Proxy-Cause: dmFkZTE6Y2Ph9Ot+4zDiVJ2Yu5JYAhsGB0shpyFopXe+7xATzu3s5x8WxxfkBW4kElackI
    WTdlJycl2qaNAf0JDKc7NBFWBQvObvEL+wz2PD6dhAEQRSlSV40lEq5/peyJOeEttBP1Fq
    YCNIA/TUNJTVfpBLE9I/PLhgY+c9dFHsClWaWGohy1U1zUAH/cqbA0SWLjayou2R/UgJY3
    q8+9OzXuHwmpUoc/bxTRuOHj8HmO+w7s4HVCOLXK9RluYrlo8Aj+x4iFSH8vo0sqNPJTB8
    ZwRsEWvswtM8s1lq7R5RVW5qNLIu/UxGNa077bdPPT9zoitYjFdbfX4TzzT/5IpKFHxPSm
    v6IKzGhAKXIZYQd8H9wDeSHffkJKpA3jo0TeZUJtrU0I2/7eu34KQYAaNGDBVOUmhGEpN+
    nJILR4D4tv35HRl21kJpD0ZvMG9R4gueLzY0ip+BK1aK0sYKWY1BtbSovf7qkmJx8Fft+f
    f1ApfyuLEXcXl3YrAH9gfdCbZ4I9h2sEvWjkLDcVTUMb6Oy+yuXsaLOeItNfjf52O4p417
    fvDsdejCra/2JkMyouQmi6J7c22DegAeI3Yd02pm3oPBH+tp9Js0nlhzqD0BRMPNLqPzXb
    L4jEySl2POuWtcIEC1MpeOyq5YZFTLOLWmVd8qqCq5qAQZzGCpBjj9FXSzAw
X-ME-Proxy: <xmx:hOzYat3dKC_iytk9aulxTZNY6w1l9qsX0UgyJSbzYvdPLofmVFDDYw>
    <xmx:hOzYarj8SKt9ZMLGDVYvrNCmrT3nKPE6axfPd0vYDINnOUwWBuPnOA>
    <xmx:hOzYarTyPj--6c5ZE2zbkAuEGgi3_cP3px8wrKXQ7zMgmMZgU8NuKQ>
    <xmx:hOzYakiSlTpxC5195TibQbbuv9Y-wzR8IzJeZFBCKAxN-Q0zX_aU3w>
    <xmx:huzYagkoI40KIINjAVDhfcGoNUaVWGhKoJHVxg0ZBaCS0lEuLWM958NV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 2E70232A0098; Wed, 21 Oct 2026 12:47:00 -0400 (EDT)
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
X-ThreadId: AiF43aUDa7Cs
Date: Wed, 21 Oct 2026 18:46:39 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dinh Nguyen" <dinguyen@kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>
Cc: soc@kernel.org
Message-Id: <f6262d7d-d5da-4be3-b37a-81ba3e35bba5@app.fastmail.com>
In-Reply-To: <2a568553-b3b5-4072-9313-a8f63d3541a5@kernel.org>
References: <20261008164735.566333-1-dinguyen@kernel.org>
 <179190784527.417156.1172897057001665375.git-patchwork-notify@kernel.org>
 <e47367d1-9c46-43fe-b657-28358def2804@kernel.org>
 <93418744-ba09-4031-b96b-24fea70d4cb8@app.fastmail.com>
 <2a568553-b3b5-4072-9313-a8f63d3541a5@kernel.org>
Subject: Re: [GIT PULL 1/2] SoCFPGA DTS updates for v7.4
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Oct 19, 2026, at 15:21, Dinh Nguyen wrote:
> On 10/14/26 02:06, Arnd Bergmann wrote:
>> On Wed, Oct 14, 2026, at 01:33, Dinh Nguyen wrote:
>>>
>>> I see that the bot has pull in the 2/2 of PR, but something may have
>>> gone wrong with the PR 1/2?
>>>
>>> I may have done something wrong? Can you please take a look?
>> 
>> We tend to pull in similar branches from different submitters together,
>> I only got through the defconfig, drivers and arm32 branches yesterday,
>> the DT branches should get there in the next few days. It's a bit late
>> because of lpc, but unless something shows up it should be there in
>> the next two days.
>
> Sorry to bother you guys again, but I still don't see the commits in 
> this PR in any of the soc branches. Please let me know if there's any I 
> need to do.

Hi Dinh,

Sorry for missing this: Alexandre pointed out that when he looked
at the branch it was not part of linux-next and did not pull it,
and I assumed that he had notified you about it when I did the
final merges for 7.4.

I see that you have a for-next branch with a different set of commit
IDs but overlapping contents. Can you explain what is going on?
I normall expect that whatever you send for inclusion in the soc
tree has seen some time in linux-next using the exact git commits.

I fear that at this point it is a little late to take either
version of the branch, but it would be nice if you could see
if there are important changes (not new features) that you can rebase
and send for the first set of fixes that can still make it into -rc1.

       Arnd
