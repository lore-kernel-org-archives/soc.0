Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792620719;
	b=rcEf9Dq135Oe810FMXcKUfpFrsrrJhXHARoEp/3ayjkddbfuTo7UmJLishriWcz/RHIn
	 j6NfvwbU3SxyTQGVO2nYGAHibZktDSagz+UML7rCO3x4NNRthUNxl2KT/Qb/hFKI0Y8wb
	 zQmUOmJKCCchu8XpQM7Fb4Y+GZjL/kaTqKbA8ECXrommdZKyBTcHi8Pio7jDbIiW9uvGf
	 xU4JWEVBc8/dh+zngwhph9RwWYzG8sCRf9tuWJB5LzEtDEE417caKRrO6i18jHKF//dgV
	 yq/yla5ZTu/5trIF3H38OzqeBRKJlqtCDSbLMB9x7djA1QmIF33mY+3n0thD/OJfsVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792620719;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:Received:
	 DKIM-Signature:DKIM-Signature:X-DKIM2-Info:DKIM2-Signature:
	 X-DKIM2-Info:Message-Instance:X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:
	 Feedback-ID:Received:X-Mailer:MIME-Version:X-ThreadId:Date:From:To:Cc:
	 Message-Id:In-Reply-To:References:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=diVWNjKYAFTtGF52+kg4yoJtUyOBdWwJP4GiW6bE1HI=;
	b=13rmGuB5sDqomElt1xTXmO1fl06oUMCO60B0R6if4Nj2PwWE1nSA2xHQkHeP+aF2/cKN
	 yue4tCbWlYkJNtP9Cn1t7hMwR3/bNZlKQcPfsdEYdB+97LoLSxYS1w78dOv8GQSQW7wfg
	 COcW13FYQjSXjamDnA30ID+4PUWCtrNeZ3PMFoAEZ5qUD0jQqn5ljXFUDBksADPAQ9i1p
	 mMTYCEpkM9uuYEqHU0EUkzJsBevXJc2EALVTZ1fOXrLsrgyqfydBKsMDkYdpC9kCsJ8ya
	 v9QZXcJs5EyWPQMOI+Xgtp6ZtdiQlkkifqzdvzfDEAaMBKewNR9sIrpuRIenwl75JoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=IHQCbfWh;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=v9cW0vRd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D967F606A321
	for <soc@lists.linux.dev>; Wed, 21 Oct 2026 22:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=IHQCbfWh;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=v9cW0vRd
Received: by smtp.kernel.org (Postfix)
	id 7A9BD1F000C2; Wed, 21 Oct 2026 22:11:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=202.12.124.153
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792620718;
	b=3UnZDt59ADytVGh292DzhW3ffRbdAZG5xcZAE5iwr5pUcSyHA+b3+JNaUrMHG2IznYaJ
	 vBXC08qWjvhKUi8BtgK3r7xAhLfEqEDIIOMAUdygnnOSWzKojiAr2xeu6kYzzbpOQnuRr
	 HX0OTHzLK75Le1RPDZNW8ZxlCJurjpaIUMkgOAgCwEVuGeImueFMm9GqR/r2W90Vf/X5t
	 yHYl48vmmZc6wQR+8mteTT2uzCgvYPMpwqmlFDmjhBvXkJjD0R0h0JQRfToRzRSIFqjsf
	 4hWgU3c+sinAQmTe6JJnW80gQvOJV9e8djSxZpeVUklg7PmWvnDrhKUk6wuNdZKHQdQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792620718;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=diVWNjKYAFTtGF52+kg4yoJtUyOBdWwJP4GiW6bE1HI=;
	b=IG5b2OvpzGFxcuiaY4MAADJga0t5TWOp48o27OFFWT1qLy3Aw984dkj3Pi3/bQ7s5obQ
	 kDJmjZJO7oQPJV0WS0WUGmtaEmkeXDNaIP7unnlzc2ggvmfEVuXYJhD+TREo83uPjksxD
	 /lXj3JKe4CsJLRW0WwIX5owFQBt9/dlv6OX9OKttc08oYJsK8NbIwmgbIZhmUmSIQdhie
	 1Y12jiRph5Pw54yN8ZSObkxPxK+SXRF35ArvWAUXXcGX2ewphDxkwWt7AWIw6lMaSIdkY
	 nP+FSlfFr6SbcVbBxWr4L34J6Zhsu3ttZb0sdf+Dmrp9Jgxu7XiO5mk56POBvYlMDVA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=IHQCbfWh;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=v9cW0vRd;
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	arc=none smtp.remote-ip=202.12.124.153
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 75BD11F000C3
	for <soc@kernel.org>; Wed, 21 Oct 2026 22:11:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=IHQCbfWh;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=v9cW0vRd
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 75BD11F000C3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C7FDB7A007B
	for <soc@kernel.org>; Wed, 21 Oct 2026 18:11:56 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 21 Oct 2026 18:11:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792620714;
	 x=1792707114; bh=diVWNjKYAFTtGF52+kg4yoJtUyOBdWwJP4GiW6bE1HI=; b=
	IHQCbfWhKlyhWvMPUomqtGIcxC/9aTOpgt4jgau5rkLwpYm1YtKwUJi4va+Ii4DE
	8OYWrDd62zwgaTWqJ1DynefBGq0iaRiKb7norMe4v+i8RYlZgDxEjVLd/ocF0pug
	jiHiiaiRfDJMH0PWNzWqfKXsnFLDpTZKmR8nCdCU0RBUs/nshCrpgdwUTzldLpPG
	a4Z5GTcfPaYjAYOxSJ5Deu/WqghOxqgMmv2cszeTi7BpgvJ93z5qmmVoxPg3coGE
	96No3HKNbFeSapy4O84/X+5lQijFGx6bAJpYGqg0Xo9+7FGeV2WXOjbY4Q45KIcJ
	yIUQXFVx7Sy1r0vj93ubGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792620714; x=
	1792707114; bh=diVWNjKYAFTtGF52+kg4yoJtUyOBdWwJP4GiW6bE1HI=; b=v
	9cW0vRd/dQKuHtSUkqT6BcPuJjI5AZdI6ldkq3Ery/n6c0PCKIPeafamF4xsvCK7
	EtHza1Hk/1IyOjRiYaobrHvzvnbq9WGFkMjgLP4ZOH44r+5kXhhjW+0sLOKwTYVa
	Ae1VV+Jde3Mf02RW5IqAlm/JF5nPmZ/iAawvZvaTugBoHZGC+7m5B83YG6t0Xy8r
	D5qh/ANaF+Qmt05dXNHD/C7AVF2A7MUa+XI1Yx6fRz3209jittK3donifpRCn8eA
	HQx62fAKmQbxGe2aIHVWtjeEFfWh8kaiHNlr1185mD8xiFphKuEcJdeJOtqNNC3y
	QrIcpLK4/0Xqwyht/NpAg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792620714; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+; rt=PHNvY0BrZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:AftoqVw2bZHTa2Mt4CWwv0jNPMWr7PKNcmwfhAqxPYahVZa
	MxSumE6Mub4Q3be4t5ugGwzbvpAJQ4qCbpq+BFtdo0uG0o8dg40aQaGR2/8vMLmE
	YEC+hlj+ctGRXhVfbuBFloIYHibjv9F9iLTPOzsJmpGhCL0aZlzI6GqeN8Ouhvi0
	QJn4F+kNFJeG02mrTNJbgmH9dDuDbm98mLrUAFYQqM2ck/lg/BD3nJ4M0MVjDQ9/
	ANCvDpSQ+o2SwM8IDqKMJO6q0CUtBefbjhPsvXeAEMMzcUy7Fywu60EwVULfUjF+
	xdbvw72i8iGTLQcihed3ksziNeNP+f/E01iahCw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:BMfSP0EaWWq3lvDMy8cmqRgmoERzA5G+7NEql4k7v+8=:o68rVCZZOVKH5TeyIwvIrDMJaSwbm/KMW1B/6I39VwQ=;
X-ME-Sender: <xms:qDjZai3IF13njyKp72hyXlDex8d7HlkzzXtTYuBajrZXTp5Wl6mAkQ>
    <xme:qDjZav58A2zGY0ZGOmTR-CC0bZnQE0zwFGNeAhWy_FZ5GzQYpVhxp1pdYNdM_1qOV
    Rs3bpoUt0rxgsKV1nyt01VlPzoS2DdCXoBiCcSIHT9d1le9KKB0d_ux>
X-ME-Proxy-Cause: dmFkZTF0HUsFyeJfrfJr7fkkgCzjU3p6Xvrloquy42PVyu9vqMT2mPaejtdXgXK13BC9Pq
    etqqytp127rTRCb8igdhFi4PLjzf+X6hlM0xXPnXB1gvwrE+5tN/0sEFDJpOEPa85ucZvC
    7DTUUjOcMv9rau14antoRasCGMlT2lHrkODnY2wfc8k27pljNLuqfsfT3qiQHpXe7+9IHF
    qY4nBowJ9xqUmKODPRPJANQjbWa7cMt1HAgVIKmRC9wgGgzG5IwsQuKAPl24+yxoADIkZ4
    Jiz4TuO2KGMdGNm6CPcOs5q6bKTf2nAfTPoP1e5+Ld3QturMkU+KNChK7bjZOaSt0egRT9
    Cps+/ko/hvmWWWqcYvypXlREa2Mm/1xHKJzcUfnCuzB43uLzUFrwVk8DCKWK2EUBrzONLi
    1LlNT5BCx5olzDO6Ow+Hmu7B3eZbQjjMoU9Bn7fRFOwxEivl2q6GsaNoe9IzKxBUWvKIYH
    5357MlkIxc0hN3thUKngcb9t0h4ZqALAOT2DR+TwYistiPtd9ow/e7IhoWirB0lV5gQXsJ
    aBwJStd3Rfqxi+WEeQf9eTJwpT8zAodW6FSD9UeQjPyRSA8JbdMR3WMyVHHY4C9F8pRn2O
    mcQE2pdA9ecgfa57HJd344E182ve13XRed/lwEIsFLATO8FM0c1lopJ3AcLQ
X-ME-Proxy: <xmx:qTjZakXY0W-XMtacaOLIyTWzDGmNHFza2ZtakVgtHDROvWgoH3ehuQ>
    <xmx:qTjZagALFQzwykJ4JWhhvjROesgFjOFVMxlEf-fYHmbtvMj7AeNgUw>
    <xmx:qTjZaly3VWVR8Y362jf2vnalk5o8nnPyUyUeZjgShUQ0RcHpSqGEeg>
    <xmx:qTjZatA91uHp804J6AOlfpa3blIQG6YuPQUrueQ9t2w12iixthTK5w>
    <xmx:qjjZanHbpXeDI2UPRX1urS-rZqpw8iTRXHjg0nbVJ2J8D1jyYJOqibvW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 7A2D832A0098; Wed, 21 Oct 2026 18:11:52 -0400 (EDT)
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
Date: Thu, 22 Oct 2026 00:11:32 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dinh Nguyen" <dinguyen@kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>
Cc: soc@kernel.org
Message-Id: <3008ed57-eb91-4eae-bec2-5109cbe2661d@app.fastmail.com>
In-Reply-To: <c4f40f7a-f2ef-408f-9aa4-57dcb7a5d9e2@kernel.org>
References: <20261008164735.566333-1-dinguyen@kernel.org>
 <179190784527.417156.1172897057001665375.git-patchwork-notify@kernel.org>
 <e47367d1-9c46-43fe-b657-28358def2804@kernel.org>
 <93418744-ba09-4031-b96b-24fea70d4cb8@app.fastmail.com>
 <2a568553-b3b5-4072-9313-a8f63d3541a5@kernel.org>
 <f6262d7d-d5da-4be3-b37a-81ba3e35bba5@app.fastmail.com>
 <202610211826058f634946@mail.local>
 <c4f40f7a-f2ef-408f-9aa4-57dcb7a5d9e2@kernel.org>
Subject: Re: [GIT PULL 1/2] SoCFPGA DTS updates for v7.4
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Oct 21, 2026, at 22:33, Dinh Nguyen wrote:
> On 10/21/26 13:26, Alexandre Belloni wrote:
>> On 21/10/2026 18:46:39+0200, Arnd Bergmann wrote:
>>> On Mon, Oct 19, 2026, at 15:21, Dinh Nguyen wrote:
>>>
>>> Sorry for missing this: Alexandre pointed out that when he looked
>>> at the branch it was not part of linux-next and did not pull it,
>>> and I assumed that he had notified you about it when I did the
>>> final merges for 7.4.
>>>
>>> I see that you have a for-next branch with a different set of commit
>>> IDs but overlapping contents. Can you explain what is going on?
>>> I normall expect that whatever you send for inclusion in the soc
>>> tree has seen some time in linux-next using the exact git commits.
>
> Yes, I was aware of the linux-next requirement and have been placing the 
> commits into the for-next branch. I was cherry-picking the commits into 
> my for-next branch. I didn't realized you needed to preserve the same 
> commit IDs as well. I will change my process to keep the same commit IDs 
> going forward.

Thanks! There are two reasons for requiring the exact commits here:

 - we all rely on scripts to check if commits are merged already,
   and those break if the changesets are different.

 - once the branch gets merged into the soc tree, it may conflict
   with the same patches in another branch, at least if there are
   multiple patches touching the same lines.

      Arnd
