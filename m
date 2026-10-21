Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792607176;
	b=I88jSJ8bHsacQ6Bk534Y6eFXa+ROM2bNzvKpc+070I5bi6jHxXBJOVR6c/JwtYQz1Cvc
	 hKui9F5JEN2XlZovCrWry0whPltXH3L6+oLKz5rW+gw1AkOWL/OP2N2TuiFMsFh7PQK7q
	 RLxf6Cci/dUxuzz8O7bMTCRtaOfx2aN22mbO0Mzjzj6TpChTrttOxIIFLOpk4l1Akg/bE
	 yYCwFf2IwTreq/VGwtZVV4PunRnFvBdLXYfsV5IjuQabDrVmg++11963PMm5xCsmqFDiB
	 ixDXYz3uFZsBfp21FVwkQTMKmw71xNW/Saa1WIOEHglAxTUk4TkYBcROWGOggXbCzhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792607176;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:Received:
	 Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Last-TLS-Session-Version;
	bh=RVLS500vJJLyp1rq2eYk022Ts56AnI8ejwyaoc1PPf0=;
	b=n4DTCukjyeLrDg+VR2KFktGaOjFNYtTKPnVjnl01ruOx6akqjDUvD6LRPdAQhMO/OyE6
	 pp8/Vk3lM03/ig85Wp5BrzM5tjUjyzA7nEM0VSNf2ppj6s6W5BpaHbGZVgmpt/6juwXHV
	 Svx4C86v533qrs9FWgzMfkIcDZopbh+7XS13qN1B0QuyigujOlocg1TAj9QNz9HBbiZT1
	 88fPfKUTjiOmcaDNjU78B7YiSHzFhOPtBP4BNjm+vJTSsL+VjFNcvgitZEHUNIVWes6kb
	 fcUaqNXSlu/gVgDVnm+vXVqWMUZzvDyrkNNLcD8fgeCfPDCiqHNp7Yulyv3g44aqqbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PCQYuOGh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44D9606A319
	for <soc@lists.linux.dev>; Wed, 21 Oct 2026 18:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PCQYuOGh
Received: by smtp.kernel.org (Postfix)
	id 4FD001F000C1; Wed, 21 Oct 2026 18:26:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792607175;
	b=PMIea/uuLeUHKz/zal0Iu8YAmRJ7+ktZbdwzbr1xvc2gbIKRu0AtF1er0OCxpSW5j/f5
	 Iq0qGVImreBclLTKkcFdkjBRMNOjeAbB7KvD8zkhUKLI+Xts8xXRkiTeeLJpi/nBUTfZC
	 0bdJtTypVOSr3AxrN7Tba90uCTDqcwYhbdOXqTTfNCg6I4FpdZAc5X24xmSJdjbHEjyYj
	 IYwgHEa8bMMWpgzbevxVXVxICH5ikdjXcFpWSV5t1+a7qYY7e8AVkwZdVO8Gqnd7gz329
	 6W47pjXlpgDhUvBwBjzgzra1Wr2FL8QGArPkUGtwzzGfhQiqfHf+KztDM2Zc+W0f5tw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792607175;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
	bh=RVLS500vJJLyp1rq2eYk022Ts56AnI8ejwyaoc1PPf0=;
	b=wD01u4n51EqncVkOg8ETS4GWVcvAFYF8slPELFe+n1EksLlzruRcFg5gtJ826z4uWl6S
	 QkVwAbI0EAgCZJWTVsF3/+Sa9kcAnBww4ig4v6DULfYH4MmG2SI6fJdQCKo+M5Vr8xkxL
	 f36IkVirDQKmcOuN32NkK/bpKkg+S7cxLSOeYrLH9oTgjVuSIgQjUZXeJe6MEvmC+/VMI
	 CnkDxdOtd3EZRx+0c0lEFLBfDrpSw+tMNI4fGNy4i5KiMe2kQJ4HiNDDBTLLJYapIHcfj
	 vAC62grkK+Pwhtc+VhvIgIvYXe+wTLzNWEsF5wf7DdTFZjH/DBRZaGnbY5R0Uhcc1eg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PCQYuOGh;
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5FFC81F000C2
	for <soc@kernel.org>; Wed, 21 Oct 2026 18:26:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PCQYuOGh
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 5FFC81F000C2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AF9274E41266
	for <soc@kernel.org>; Wed, 21 Oct 2026 18:26:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 690FC606E3;
	Wed, 21 Oct 2026 18:26:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83A9B10328D6E;
	Wed, 21 Oct 2026 20:26:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792607167; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=RVLS500vJJLyp1rq2eYk022Ts56AnI8ejwyaoc1PPf0=;
	b=PCQYuOGhIN2wqLUvvH6bjvYJK48BsnD6k6lRh+htfEmRY3P04csS6PH1cV1KmTsah8eqNH
	LtDffJr4457elOKAsgIDohFdKuLpIxQEs7nY0Z40EkKlY+VBG1VczCmfby+tLDvGCsUncs
	SdPdiewmjXIAilCXdU60EfoIBzyoV6fUrFpI2RbUIDU6GaoPFQZbDT3/5fP59ywuKeKtNu
	QaXqdZkxQ0voaF82bMbr0Z9iLQQLXZn5QNwFjt+kw4xdA5KcZX+LcVlZ1eReh6hKXW9ftq
	SW/7UXWeCDX/Rd6sSLSoWKNPdMHhn63jnk6dAvuwQTfXukSzWn6mDmmJuyQLLg==
Date: Wed, 21 Oct 2026 20:26:05 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Dinh Nguyen <dinguyen@kernel.org>, soc@kernel.org
Subject: Re: [GIT PULL 1/2] SoCFPGA DTS updates for v7.4
Message-ID: <202610211826058f634946@mail.local>
References: <20261008164735.566333-1-dinguyen@kernel.org>
 <179190784527.417156.1172897057001665375.git-patchwork-notify@kernel.org>
 <e47367d1-9c46-43fe-b657-28358def2804@kernel.org>
 <93418744-ba09-4031-b96b-24fea70d4cb8@app.fastmail.com>
 <2a568553-b3b5-4072-9313-a8f63d3541a5@kernel.org>
 <f6262d7d-d5da-4be3-b37a-81ba3e35bba5@app.fastmail.com>
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6262d7d-d5da-4be3-b37a-81ba3e35bba5@app.fastmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On 21/10/2026 18:46:39+0200, Arnd Bergmann wrote:
> On Mon, Oct 19, 2026, at 15:21, Dinh Nguyen wrote:
> > On 10/14/26 02:06, Arnd Bergmann wrote:
> >> On Wed, Oct 14, 2026, at 01:33, Dinh Nguyen wrote:
> >>>
> >>> I see that the bot has pull in the 2/2 of PR, but something may have
> >>> gone wrong with the PR 1/2?
> >>>
> >>> I may have done something wrong? Can you please take a look?
> >> 
> >> We tend to pull in similar branches from different submitters together,
> >> I only got through the defconfig, drivers and arm32 branches yesterday,
> >> the DT branches should get there in the next few days. It's a bit late
> >> because of lpc, but unless something shows up it should be there in
> >> the next two days.
> >
> > Sorry to bother you guys again, but I still don't see the commits in 
> > this PR in any of the soc branches. Please let me know if there's any I 
> > need to do.
> 
> Hi Dinh,
> 
> Sorry for missing this: Alexandre pointed out that when he looked
> at the branch it was not part of linux-next and did not pull it,
> and I assumed that he had notified you about it when I did the
> final merges for 7.4.
> 
> I see that you have a for-next branch with a different set of commit
> IDs but overlapping contents. Can you explain what is going on?
> I normall expect that whatever you send for inclusion in the soc
> tree has seen some time in linux-next using the exact git commits.
> 
> I fear that at this point it is a little late to take either
> version of the branch, but it would be nice if you could see
> if there are important changes (not new features) that you can rebase
> and send for the first set of fixes that can still make it into -rc1.
> 

My mistake, I forgot to notify, I wanted to sort out whether the new
dtbs_check warnings I had where due to the renaming or had another
reason.

After removing some false positives, the issues were:

cbce4a0dacb6: arm64: dts: intel: agilex5: add USB3.1 controller node
      + /soc@0/bus@11000000/usb@0: failed to match any schema with compatible: ['altr,agilex5-dwc3']
        from arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi:534 (dtsi)

The issue here is that GKH never took the related dt-bindings, I
believe because Krzysztof had comments on it.

29f11fb83ad5: arm64: dts: agilex5: add support for debug daughter card
      + /soc@0/spi@10da4000/eeprom@0: failed to match any schema with compatible: ['microchip,25aa128', 'atmel,at25']
        from arch/arm64/boot/dts/altera/socfpga_agilex5_socdk_debug.dts:101 (dts)


It seems that there is a different version of the branch in linux-next.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
