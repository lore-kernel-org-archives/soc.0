Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1DD21A95D
	for <soc@lists.linux.dev>; Tue,  2 Jun 2026 13:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405255; cv=pass; b=icRMNitcqWcG/gcctJ3UIX1R0GHGvcak3JVmeUigKG6tcRIsNkTV9CH3aEjYotnYTcjzMM+5GiGSozpEGezm3WGh64JjuyrSkWbd3o0LpyCDyRIIoPY/Mx9m1QWqzCLsP+FT1KgI2CLeapabPFpL4kROOaUIklMilsePjAqmkxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405255; c=relaxed/simple;
	bh=tsOsFguntWmtZfFDpsPye6GJE8zC1k74H3xDjPWskvM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=VvEamdFdhFHXRMLKV00PLN7CW4ey65rI5vbvBEKQk86sFIjgeple5NJCQIS/X4rORXcIgr6HpARLvmeNqHIARViFEz7yxh91mM9cDyfOZGJ9vZo3D+mebDbGmBT8Q2iXreqpkTbZxa/bjIe7FHNQzXG0MAnhqs0jjsl2OQE5Ef8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=mmizrCdc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=b9Uhk8R6; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="mmizrCdc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="b9Uhk8R6"
Received: by smtp.kernel.org (Postfix)
	id 1CC4E1F00899; Tue,  2 Jun 2026 13:00:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=202.12.124.146
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780405254;
	b=fBWTpaMQV4CZTbdoJBAIOmYm/x519PxcbyOwBO5ZwjBBQldGHGTzwNdSac2+Ztuu5OrU
	 vPcLmYzmvuT8puGlDCAghm2zTtoRY1j/UudEzQel42//MXn8vnVFCWhdmGag/Gx0V+Fsk
	 hKN6Wwrd6GEem2Elv1LqOkd5i7R/aghjyV+zEXf3HyfIVgP0mZid/8ECKEGE0cFXi+bwW
	 RPA7vfwtTqnF0Qfa5qwecat5Kk/8sPkmuSYR9UVipUhAKu/+Iihr28dXTZ30coWnzluyc
	 5YBYUBVgh2rLbMI/DCC7Oz9RuxuCUcBppHM4g2v2OEdQrZB9xQVPDXw1L2Iln3JyQng==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780405254;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=9RL4IXQNnvR5OrJ4NDd1gnd5VsgEFCOVln1CtTd3y+4=;
	b=rXLQPAOpIf9P+oz0Uk+H1dglP84s1Uwf5AnHdaxt+h+AFlcO6OyW0cHaZT9igcNZp93S
	 1aStQ7NSK4pLiul/lHCWv3xI/v6qArSJJgH3US1JR4F/mWKjjzvGrRKGiWElIqWOLAHWc
	 vQsaEyI3isdHzRCIvU+EszBOouXtD+qxTI48H6xxOCuzG9ECFAVK6Djpq6Eee+2mdokiZ
	 pNe8M5w/XuPY0n9pMrHx0Lm2pywsedpHF5NUphoG2cCOp9wq/LFZylTsM4PyN5DVIcequ
	 OWj85l6e4JBDO0f628eZWInTzmWj0DX22QMEVAtdkAeG6aFsZ/4xRLxhFXQlLCzYP5w==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=mmizrCdc;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=b9Uhk8R6;
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	arc=none smtp.remote-ip=202.12.124.146
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6AC061F00893
	for <soc@kernel.org>; Tue,  2 Jun 2026 13:00:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=mmizrCdc;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=b9Uhk8R6
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 6AC061F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 60D361D00134;
	Tue,  2 Jun 2026 09:00:52 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 02 Jun 2026 09:00:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780405252;
	 x=1780491652; bh=9RL4IXQNnvR5OrJ4NDd1gnd5VsgEFCOVln1CtTd3y+4=; b=
	mmizrCdcSfqMpOhwJLMZc2rgzEMfq/9VHbsXQJrAZK4yDF/Zb9SRL7yqHcGff4ES
	SLjPWLb8W3FFHk27lNy3CTWhIYaLO2fTPYXWRZ5+a2LE8WGE5aC0hDu1N5vC1wxt
	pNDmDuebEWXgeeKT+caA8B+KKsJ2zL0OCVnOTkMj+BzKRH7I65B9cMknXmzWBG6U
	YTNdmP5AgJ///n/VB/GFTv1T2c4+2d1I2E+5zCdZgNGBm34uh+COkAT6ZuswePPl
	LBM80yRU47BrpTyKPKG7fxVTEgI7eyu5YBWkMJxlHJmoiMuw22LEKo1aF3O3u4F6
	eyYYYtvVdefqfT4hgxnoNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780405252; x=
	1780491652; bh=9RL4IXQNnvR5OrJ4NDd1gnd5VsgEFCOVln1CtTd3y+4=; b=b
	9Uhk8R6PraKpomx7srRF/IdaHyANkG768YgEUeExwdcGM0gP8aPPcgUoEhUxXnRL
	Fz0M/yOaTqFAb+xtg+sJ00dbmyMYVgVNdWnh0MWv0MnujVHZbWM80XDsy70crbu1
	6Tc6AIOx8qA2DCAr+xsDeu67p4q7em9DL5ORoInAkvWNY4nNzqZ/c2bzpoVglKYb
	UKyVATN/4uEEiDGLElmlgPdklG7iPGpfcVp6ePYq3uTOaISM068IR0qvT3V2XF13
	arXkLn4wBsci1aYD9Myqy4a3igrPnxx4c9B6Tq9O7jVParm0BajuAauLQmd4Y0zD
	bjfhJFg4IvFUrrDgYt/0A==
X-ME-Sender: <xms:A9QealOcueNJlXmZE7esHCVh9Lgv8jT7Wf_G5zqm1br7mrZ2G3X2cA>
    <xme:A9Qeaiz1jKrvJajzSwVRjhVTtqkinRZXpKQk4n_XEr80Tte2wHrcPFACYjC_fMKSB
    5iNqVXdTTMZhvaQITijpEMdSnsJX2E_3Qb39DkJrtT7OGFwc4c6Alc>
X-ME-Proxy-Cause: dmFkZTEkGxuOs3ouQCYFDPFIXOCBzJZhfyxXsy6mF8/MHRRceXWHbd28wwpFrVim7zFH2R
    EpfelRrXVhA4cl+WsZ1yXDgjP0wmXhRiLFsaEICAaHzj7RzuwoElNSRFsm+X/unjJuNWRI
    60fozwWXNzA2fhHsvSRscDKK6oRBMtM2bYckwKTSAwn70iiwNKLdBYp1l4gHRbsxi2pXhS
    6FkI2i2SZr6kthqMH6hqabRjsz6foE0lnipRLyeAWWajU8VvBkC/YDe+eVgq76uiOmjBFm
    KyhtTkTypoM5LL8BZWqtvbMA/CJ1/JbdCpvYXsdX8E9UCX38cp6jUl4UCH5DOjh8hK3qoH
    Sz3FH7Y7bhA49kJFT9B7CxwgU/tFK2s8TmFGlZ7OGCDrIK5kLUIWFdhCw8+QrMKosyJbZY
    MempC9KOKEMGoCOQ7qDhIyzinJpPTZbN+2LN6IB+odiPCOOBS6OFL9MulsKCB039vLCuQp
    zdklBlJzoh0rnWYowX9hA3u3ARcCTSdm4QEC/ADW7ixQiMy3m4RLdS4l0WEmBPph+59WUR
    fja4QbbhbM5A909i8fRjuCCPWjRkrofLV9aBM1iL7Gzrk8xULFnvF0YhMsoV4ZGauKIle8
    QtX6GYi+uZtDMjDg7pQNagLGNe7xxRc7HlkC1IbgzTy/tsjRLOqJWCxEqqeQ
X-ME-Proxy: <xmx:A9QeatKDPlfYqBg6RvQMCcBnKFgIJpCa5mLUPmlhBUUDazNQhV5WqA>
    <xmx:A9Qeag5Qb9oPvETgXgbCGwCZnxACZNOF1z_dkVb4pF0FnkX8lZHJ1A>
    <xmx:A9Qeaowlm17_TfFJfJWcF5ThLhpOIrI9Sfz2qU2cuZSWZkyBclCvPw>
    <xmx:A9QeasZFbLsOpiX7L5Y6_MWCzFMTo8mQB1UdDAZW_QG7CliyeQwK4w>
    <xmx:BNQear0j3vKQ0Wo0gUyoTULMQIUjeDu_qx2pMdquThuq0xYWpSRHqjKJ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B7043182007E; Tue,  2 Jun 2026 09:00:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AXmBUbiQg2Mg
Date: Tue, 02 Jun 2026 15:00:31 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Michal Simek" <monstr@monstr.eu>
Cc: "SoC Team" <soc@kernel.org>,
 linux-arm <linux-arm-kernel@lists.infradead.org>
Message-Id: <55c1b29a-cdea-4508-b77f-d5a2da247662@app.fastmail.com>
In-Reply-To: 
 <CAHTX3dL2W9iZDWLk=OVmno0ZUHx_EkXrJqskmpXCM_CQROWgEg@mail.gmail.com>
References: 
 <CAHTX3dKWE6DOPLXPq31wRiXfjac0TVqSOAOLP8itHoGYpF9eBA@mail.gmail.com>
 <b56b09af-cd0a-4061-8cce-5e8a50033b4f@app.fastmail.com>
 <CAHTX3dL2W9iZDWLk=OVmno0ZUHx_EkXrJqskmpXCM_CQROWgEg@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: AMD/Xilinx SOC changes for v7.2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026, at 14:29, Michal Simek wrote:
> po 1. 6. 2026 v 22:39 odes=C3=ADlatel Arnd Bergmann <arnd@arndb.de> na=
psal:
>>
>> What type of userspace would access those, and why can't
>> this be done in a portable way?
>
> multiboot is useful for A/B updates when used. It is also pointing to
> where the boot image exactly is.

That sounds like it should use a reboot-mode driver. There is
a patchset that streamlines the reboot parameter passing that
will hopefully get merged soon, see:

https://lore.kernel.org/all/20260514-arm-psci-system_reset2-vendor-reboo=
ts-v22-0-28a5bde07483@oss.qualcomm.com/

If you can't fit this into PSCI reboot arguments, you can
add a custom driver here that picks the A/B update etc

> idcode/pcap for fpga programming case. That your bitstream matches the=
 device
> you use.
> Scripts or user programs can use them.

You already have an fpga driver, right? Why is that not part of
its user interface?

> IDcode could be the part of SMCCC_ARCH_SOC_ID but we can't change what
> we have done in the past
> but we plan to implement plat_get_soc_name() which will also contain
> IDcode. That's the one where a standard interface could be used.

I'm not sure what plat_get_soc_name() does, I don't see that in
the current sources, but can have multiple soc_device drivers
and use soc_device_match() in drivers to compare the ID
string from the platform with a known lists for things like
driver quirks.

If there is a hardware interface to find out the ID, just add
a driver that registers another soc_device in addition to the
SMCCC one, and soc_device_match() will attempt to match each
one separately.

>> > zynqmp_power:
>> > - Fix race condition in event registration
>> > - Fix shutdown and free rx mailbox channel
>>
>> No objections here, though they look like bugfixes that
>> may be 7.1 material. Up to you, but don't be shy about
>> sending things as bugfixes when they address real
>> problems, it's better than waiting for the merge window
>> and then immediately asking for a backport.
>
> It is more about time not about being shy to send it.

Ok.

     Arnd
