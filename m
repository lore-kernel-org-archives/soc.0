Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AB3306757
	for <soc@lists.linux.dev>; Fri, 12 Jun 2026 13:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781271943; cv=pass; b=IrLct23v1SmNOreV4qYm1j3I7J8tYdDrl3JnUEzljrREyc3hmI6uACctFPZ5HJOAvSQ3nsZQYwJpGghJA5nfLQcz+/GE33RC5vMuTrswFHmgWwjHqHfLWUUGJFezMHbj7qNfYMyFNyEHXBn8whNJjEL6DF5iVDkKi4PLHZt9WRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781271943; c=relaxed/simple;
	bh=zIlmnMfdQ9dwPn+0xxd8AIYk4i6CC1GerbMbZEYg590=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gDykLlgO9aSNfV5eU+cFJZLJ03SF5gVMX8XkJ3wLEfmqP0ckfhSAQWjiYFfp3DrIaFpa+9oF6fwp2fAzrjui/JV1gW2wZrFHiSolf077A/mzJ32m5PFroHebX6uzJkkEWMGHw6x+r/Fr8cnGE81ZP96wV20rBkfvrs82WAuHfKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xcIvkfGO; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xcIvkfGO"
Received: by smtp.kernel.org (Postfix)
	id 477CD1F00A3D; Fri, 12 Jun 2026 13:45:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781271939;
	b=lhNypBzj/wLmPj7AInDzypV5Def7txro/igDqU/YJUVa/909CipGqQMFA/YhPkkdPZtv
	 bqjyx/eiTiRvg87cnyktNYtWJz590SBOnf/v7slWOsejFa0hhRzBxWF9YxWG0WwvzZF+Q
	 NmU35/+3BQjiwQ9auNpFL60WX+K4DEAmr1XXNT5bq/ZPZB4sT1wxTUy7uWhKpEPT6UVIA
	 FgPGCQQe08m5mBHv8adLRVuI4X+kgBdzrjFU/blCEZUCVDL/J2wY4dYH9AiEcXPc2pLnk
	 VWhAelutR+pkfFBhhpsSuApCLufkYMmxkUBW6/jcCUlbPgEO+M3rY3REps5QUtYCkYg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781271939;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=4kbuuuOZWUF1RFETFe0hK/FlP92aPI0TPvOQIoPd0E8=;
	b=JAZT1RO488ak1GMFljj+dWjQ+cZs5eTV0IycyRdmKi7/G9JJYcwbnDDxEB9ZFhYxjBqE
	 lyJ7h41gDHvFnvSSb6jVng/JdLYBCGVspUYhnnMqhXLdHkhnm67cIjRFnRO0z1esDwbKZ
	 2G0UVuhhRWmQJwobimSgAFrFrqyf/LBEC571/4JhArDIX3fsrgnQg1Ds3DGRXiq8Y1Wbz
	 aIolAQBVAu2jN5H8j6uqUSzYA7yK7Np8yQ5GPzkgCcKGpnvxNSCFzIPswPz4BBN5i3dAf
	 hP/HzmjmhOKjV4PdGc2/Jp8NyHenv2z3FiEMAdPU4H0rJN4e6UUhw73JQiB/HG7fURg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xcIvkfGO;
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4AE021F000E9
	for <soc@kernel.org>; Fri, 12 Jun 2026 13:45:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xcIvkfGO
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 4AE021F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6BAC8C49F7F;
	Fri, 12 Jun 2026 13:45:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7DABF60012;
	Fri, 12 Jun 2026 13:45:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BD0E0106C8B01;
	Fri, 12 Jun 2026 15:45:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781271929; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4kbuuuOZWUF1RFETFe0hK/FlP92aPI0TPvOQIoPd0E8=;
	b=xcIvkfGO6BEMQx4gfN2/H+Sa9bOcBUzyRTA7j5F3DAaNPQ+/ImEN3M+tplPXBhjQkmYBYU
	hLIjk8oORe2+mOx6efgWHaQ6lxJ3jF5bKQHAtniCl90GqD9YvFmpK1NnOb0UXw9843N2wt
	2oU6ZbnPwkj0okTBk4e5tiChliEVEXJ2DENMJoHWvP+VxkbcatMjU/NijU0QZ89uAocdzH
	nysBLkApkGJ96Uxklp+RLr86FrbouBKVYNPP84+GJ3LqVn4QrK06ZIuMg10grsHaKo837E
	VC7z2NYTRhnJTWqMa5qJFvB6dLjvMsuYFZYUUrqEebg11KH2B6Q5AycJrqN8xw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>, Aleksander Jan Bajkowski <olek2@wp.pl>,
 arm <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v7.2 (#1)
In-Reply-To: <8de15abe-8352-41f2-85c6-bdb50eb18e9a@app.fastmail.com>
References: <8733z1c8uj.fsf@BLaptop.bootlin.com>
 <bf8092a3-d037-44ee-8e08-8b2204e5cc95@app.fastmail.com>
 <4e690104-b42f-4a2b-ac52-5ebfc82f6853@wp.pl>
 <956403e3-d47f-498c-9f62-79d39c1cf5db@app.fastmail.com>
 <8de15abe-8352-41f2-85c6-bdb50eb18e9a@app.fastmail.com>
Date: Fri, 12 Jun 2026 15:45:26 +0200
Message-ID: <87o6hfc1op.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Arnd,

> On Tue, Jun 9, 2026, at 21:29, Arnd Bergmann wrote:
>> On Tue, Jun 9, 2026, at 19:35, Aleksander Jan Bajkowski wrote:
>>> On 09/06/2026 18:11, Arnd Bergmann wrote:
>>>> I'm a bit surprised by this oneline change. Since you successfully tes=
ted
>>>> this, I assume the change is correct, but I have two questions that
>>>> I would like to have an answer for before I pull it.
>>> By the way, the upstream safexcel driver works correctly only on=20
>>> coherent
>>> platforms. On non-coherent platforms (MediaTek), the SHA-384 and SHA-512
>>> selftests fail. Since the selftests pass on Armada's SoC, I assume I'm=
=20
>>> right.
>>
>> It's not necessarily proof that this is correct, but it is quite likely.
>>
>> After checking the datasheet some more and finding that this should
>> indeed be coherent everywhere, I remembered that even the old
>> 32-bit Armada 370 had a coherency manager. At the time, we used a hack
>> in  arch/arm/mach-mvebu/coherency.c to mark all device nodes as coherent,
>> since the original DTB did not contain the correct annotations.
>>
>> I suspect that the Armada 37xx started out with a copy of the
>> old DT files and also never had the annotation, but then never
>> had the same hack because arch/arm64 does not have platform
>> specific code.
>
> After investigating a little more, I think the correct fix here
> will be to mark all DMA masters in this SoC as dma-coherent.
> I thought there was a way to do this for an entire system,
> but I could not find that, so this likely has to be done
> for each DMA master separately.

Thanks for doing this research. I also checked the data in the datasheet
before applying the patch, and it appears the platform is coherent. I
was surprised that when we initially submitted the support request,
Marvel didn't mention this; usually, SoC vendors like to have good
performance numbers. However, they also didn't say anything about a
coherence issue. The fact that the test succeeded is a good indicator
that the SoC is indeed coherent.
>
> Not sure who still has the hardware and has time to
> test this properly. Given that the incorrect DT has
> existed for over 10 years now, I assume this is not
> urgent and I will skip the pull request for 7.2.

I believe I still have a board based on an Armada 3700, and I should be
able to find time to do some tests.

Gregory

>
>      Arnd

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
