Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459DE289E13
	for <soc@lists.linux.dev>; Sat, 27 Jun 2026 13:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782567948; cv=pass; b=KnPI6UPqFDJjuZwgfe2NcIcQHz2to4E+/+vgecd8sScuYIdl2ZCG+r5bqtVfQDy3VrN3T8y1Cpja7XwwTGcfkXfPUuGw3BKSwh7a+WUNKpvUaVi2QrOwOcUDYpmzba+nfiIqe+YkTwP5CX5aKtK/Pr7F0z84bp22sr1OS4PvXUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782567948; c=relaxed/simple;
	bh=UIytBx6gvbPuU/lSWTOWTQ9BTB+4OuHrIf5gizURH4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d4ngk8gvfqhprN5ujHto0pk3npVHTUM9CN4zVJFjutZzaCPXjxvF6MdPDNS+SDXMSEKoj/6H5JdThc6m7qeagoEFlNN4569byFHOnLeaDN88DKz+wzsCR9ffxXCzG/hGe8v3CFadrc0URH8v/f2fKaXYtVcwXvwDBhQ1r8CR4aQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=IlHf0kT4; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="IlHf0kT4"
Received: by smtp.kernel.org (Postfix)
	id 0F4851F00A3A; Sat, 27 Jun 2026 13:45:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=212.77.101.11
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1782567946;
	b=QtoCeKfxjBgPFUXWn4EOXxMo21HRV0D/W5V/CzL+wLlGu0enkyfREBLY3cMcOxjH3O0t
	 V7cwGE5pcF24OBH9DgfPG7WRGXp/rh/71JnP8vcnbzvKa/3ykSRHSOKv69Vr2sgx2ry1w
	 T0QwsjkGYzrydbnS4C0SUJIJacjVRVYPs7VAeT0PTWoSkpMIf3Y5+guTcmfzKxVY3zMdI
	 Yo/paFAxX9wZ6KEsg+UQle44b+sl4iJH1Mit6PNOZIimCzDB5sbbU5DASlpUbWwJIkEH4
	 4MCc5Wv32bVTNouh3R3sxzDPxIAnZXIpWrgzTOWXVivoJegCOUAuWfvnL/QNBKb9E2A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782567946;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:X-WP-MailID:
	 X-WP-AV:X-WP-SPAM;
	bh=mImsURL/xNZVlxINAFt8hNVYTcNTARXrkLajjIw43gA=;
	b=xgybTggd8fKIxH0vSBDfUdXbAuoVisllPZhZXO0CzwACyCVlsALzB7tQjk2pqb86QzkZ
	 FbI8F4WFxSrpeYms3tV/IjFuE8tXJ1NuhTXug7Q50XRSDc/9iF+EIOAlvAMpOzmDHBU9/
	 K5GW5PZcPmwUdMPNi/pSJ4nRYAMl4IyYqbpqdK4e6DJO4UDfNjh1RSV4VcySR4v+bxGYa
	 QXJLjy9vlvCyc0w29Ekd4JHxAVLo0cD1EeuBHDjJ5ENEXYzSLCAk9KNoFa11BkX5aVkTJ
	 Er+/TgR7wkXvdKrMGrZHyzuYK6hdlzl68uYXAt+H271IxApWd4yxRR6mdAsv3s+ht0A==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=wp.pl header.i=@wp.pl header.a=rsa-sha256 header.s=20241105 header.b=IlHf0kT4;
	dmarc=pass header.from=wp.pl;
	spf=pass smtp.mailfrom=wp.pl;
	arc=none smtp.remote-ip=212.77.101.11
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E250A1F000E9
	for <soc@kernel.org>; Sat, 27 Jun 2026 13:45:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wp.pl header.i=@wp.pl header.a=rsa-sha256 header.s=20241105 header.b=IlHf0kT4
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E250A1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 13402 invoked from network); 27 Jun 2026 15:45:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1782567936; bh=mImsURL/xNZVlxINAFt8hNVYTcNTARXrkLajjIw43gA=;
          h=Subject:To:Cc:From;
          b=IlHf0kT4yTo3/HAPOqwi7oHDjxKJV1/2xPnWh3koR5c5ajQpfC+bfgnzIrg+88oes
           XpKmtGGkFFH9limMxIRsJ/Lld4s+krebinBUnZ7f7rVMCq1LImiau1R9Ezh2uC5vOt
           DSaUmra/vdc5+Nm7n4YidAI/QzlI2prcEGh5xvp/73M5tWs6syyd4wVao7lnkz1hvx
           CctzMxvReFZZtMZoya/B/Z6iyBALmpziQDt4ElUEbWxFL5RjahBo7qdtfmqGABVmrV
           ofBh03zbAUmOdRGPLPnuaFnf+4ZrPHibxFMdu61rA4LE6e6zhl2SJSLO+gfHvMQy8b
           bqbfHVqoiipNg==
Received: from 83.5.235.152.ipv4.supernova.orange.pl (HELO [192.168.3.224]) (olek2@wp.pl@[83.5.235.152])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <arnd@arndb.de>; 27 Jun 2026 15:45:36 +0200
Message-ID: <6079065f-8fbe-4dc1-bec3-bc3ef9d7a5bf@wp.pl>
Date: Sat, 27 Jun 2026 15:45:35 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v7.2 (#1)
To: Arnd Bergmann <arnd@arndb.de>,
 Gregory Clement <gregory.clement@bootlin.com>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 linux-arm-kernel@lists.infradead.org
References: <8733z1c8uj.fsf@BLaptop.bootlin.com>
 <bf8092a3-d037-44ee-8e08-8b2204e5cc95@app.fastmail.com>
 <4e690104-b42f-4a2b-ac52-5ebfc82f6853@wp.pl>
 <956403e3-d47f-498c-9f62-79d39c1cf5db@app.fastmail.com>
Content-Language: pl
From: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <956403e3-d47f-498c-9f62-79d39c1cf5db@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-WP-MailID: 5aa5d5f268651f9b93b0272d375535c0
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [ETOc]                               

Hi Arnd,

On 09/06/2026 21:29, Arnd Bergmann wrote:
> On Tue, Jun 9, 2026, at 19:35, Aleksander Jan Bajkowski wrote:
>> On 09/06/2026 18:11, Arnd Bergmann wrote:
>>> I'm a bit surprised by this oneline change. Since you successfully tested
>>> this, I assume the change is correct, but I have two questions that
>>> I would like to have an answer for before I pull it.
>> By the way, the upstream safexcel driver works correctly only on
>> coherent
>> platforms. On non-coherent platforms (MediaTek), the SHA-384 and SHA-512
>> selftests fail. Since the selftests pass on Armada's SoC, I assume I'm
>> right.
> It's not necessarily proof that this is correct, but it is quite likely.
>
> After checking the datasheet some more and finding that this should
> indeed be coherent everywhere, I remembered that even the old
> 32-bit Armada 370 had a coherency manager. At the time, we used a hack
> in  arch/arm/mach-mvebu/coherency.c to mark all device nodes as coherent,
> since the original DTB did not contain the correct annotations.
>
> I suspect that the Armada 37xx started out with a copy of the
> old DT files and also never had the annotation, but then never
> had the same hack because arch/arm64 does not have platform
> specific code.
>
>> I have a plan to send a patch upstream, which has long been maintained
>> downstream in OpenWRT[1]. But I need to think a bit more about how to do
>> this properly.
>> [1]
>> https://github.com/openwrt/openwrt/blob/main/target/linux/mediatek/patches-6.18/401-crypto-fix-eip97-cache-incoherent.patch
> The patch is basically correct, I think you should just change two
> details:
>
> - instead of defining your own SYSTEM_CACHELINE_SIZE macro, just use
>    the existing CRYPTO_DMA_ALIGN macro that is used in crypto_dma_align
>
> - move the 'state[]' and 'cache[]' arrays to the beginning of
>    safexcel_ahash_req so you don't have to manually align them.

My biggest concern is the increased memory overhead. On Marvell
platforms, this increases the structure size by 150 bytes. I’ve
checked, and both CRYPTO_DMA_ALIGN and ARCH_DMA_MINALIGN always
have a value of 128. On MIPS platforms, ARCH_DMA_MINALIGN is set
per SoC in the mach files. I assume that on a Marvell platform
with coherent DMA, I should set the value to 4, and on a
non-coherent MediaTek platform, to 64. How should this be handled
on an ARM platform?

Best Regards,
Aleksander

