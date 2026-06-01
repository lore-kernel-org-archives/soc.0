Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1523815C2
	for <soc@lists.linux.dev>; Mon,  1 Jun 2026 20:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780346402; cv=pass; b=bftVL1qaRJ7pv285IxsO4vikxzMkYH4eDU9HwCcFbQM9A9plZigpSi7y5Va1vvdi8v9b+KD0Yuve40Reo4quNR5Vx6LKursdPUCTTHmau7Gjs8dreBhD0laH9+Cnjc1mmHtdTX54djb+4GLf9BfoXXJAKtO2NdY7sxZuWYTROlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780346402; c=relaxed/simple;
	bh=t7eQJ5fqZd/Wj0k1zMr+9Wi4RV74PqYq29Nz1QaVDH4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=F1MsHHHqYDvDUrRPMz0WItoqHONWtzb7WhXgFHSUYK/lGpek0XlYd4tOfGP3iCYYgFRjpRBQJcAhrCmbuxmEB448ExA6mU7rBfrZFc/WLq9ucqULtUQ5i93Nbbx+c1i/Ig0YThFKeI8HkJWvT4BlW4URxbym2ly0Wb6EpY62wRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=eWJDqxGP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HfBY7E3M; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="eWJDqxGP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HfBY7E3M"
Received: by smtp.kernel.org (Postfix)
	id F3D431F00899; Mon,  1 Jun 2026 20:40:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780346400;
	b=WC0dLdFhZ6ULNsxkYjiRBSvyq4avaRtWTM78fwk0dhkVNB5yzzh+wO1SGlx5Gxlhfg1f
	 KkeQtQK1gi615Nf4pbpB4Rl6PtlKmZQOKrqASOsk0ItQBYMQIqlAYjuHQ3CzNNCZMWr/z
	 Ro+9oFBVOfgMZmriq2tPG8ErCi7ej7V/SixkwVBlIl7zLRrUXqh1POQX8Qrgw/1PxyFSf
	 5MUe8vr2qHQ4OksbvVw6tEJ7tdarrxNuNTGD/4mXdg88L7z13TowkYOzaaYASG9LpTlqb
	 tQ3I/viwBPKCsgjZZRU2Eq3qhiKo12xY8y6388bMngmw+SxC6p+AS/BTu89bJQvhoMQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780346400;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=KjDPQTzWZgJz5hUkpxM6NuNPlWaV6iGvvvHZkVbr2qM=;
	b=BNya5ZNi236hA0wpgeZ4CBZeXs4Daea2FUsPst9pskZcTjoF+ccrR2CizfD3mxKPlQng
	 BfZcC2Z765GkptaIQgsbj4QWuATalUSOqrT4YFttwCiBZLnPXboZfJjUJnUk6UZEFdplp
	 pFedxztWJgSfkik5cADSI86UAfuOQwix3D04fVoGYzPYTkWV3cFdtUsu+xKbPeKVcsGmJ
	 vgfKLlSbY5dJPG9jr3VPLTyZ6xwl7wlYEEEvHVv9qrNcLQ5QU1QnpIPwHkmxZjT4Z9RDQ
	 +jx6StViatpDirxfXkG8mkq07FH3tpfo1FJ1fnKPkBxeoa0WQcqTtpGpKeFVHxuCYmQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=eWJDqxGP;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=HfBY7E3M;
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	arc=none smtp.remote-ip=103.168.172.149
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AB2591F00893
	for <soc@kernel.org>; Mon,  1 Jun 2026 20:39:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=eWJDqxGP;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=HfBY7E3M
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org AB2591F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 6F7ABEC0096;
	Mon,  1 Jun 2026 16:39:58 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Mon, 01 Jun 2026 16:39:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780346398;
	 x=1780432798; bh=KjDPQTzWZgJz5hUkpxM6NuNPlWaV6iGvvvHZkVbr2qM=; b=
	eWJDqxGPAtFjEdSVmZY4J622llJrXbYMLYgbpMcwFbygTFtCdOVSYasqaJm8Zxyr
	1uCTVFymzRXuJ02kYq4zPhyDmzhE9qLoNqtnzJmwe86cu6PKI0vbJZvKniX2zJ7w
	agYdHJddAkOr919SgU/PDNDS6q0n4fvvBFeqnpoZNHbyMgpyAnQYJG6zUqcuqA7M
	UeDPAGivLh4NnC6B1ABSBEtTbUcrYyExUzHmQswlv2UbU6E18tJRQSfUX/gGP1xB
	kVI/dKPzF/SXfrHTuWSkW6429ETs8zz4B7dnZClTEFCFbendfqf0Cu1Av+4JSB7t
	B93skT5XELDqBY+KAcJOEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780346398; x=
	1780432798; bh=KjDPQTzWZgJz5hUkpxM6NuNPlWaV6iGvvvHZkVbr2qM=; b=H
	fBY7E3MWeja328cgtxscYL97ZfX3h2fmwNwio7McM1ebi0mo9DSBmFdf97Mnc2r4
	0r4Ry1lx0YtxLJ+ETelWlOG5tgLDKYSQHRvrtdvlLsq3xyuV5jOAFyT8fElW7uw+
	4LaT+xBOv/c52pboyKIooraeeKDkiHbRUsWrgYBO83aydYDVAMCKqsdNI9S0bK26
	kRuWsCY5JbFtrud4qW1lSwDreDA/iZ2oveDFQl63yYQnU+oIqhZjXVZaTIPHuMxY
	Kw+N2ibwG7Qs6zBE/xDss45vErJFKgyy3hPHYxaWdFVaFxxLFIQg15UmV8MnTH4Z
	9z48uiHiQOCePBmlWKL8Q==
X-ME-Sender: <xms:Hu4daoNub5iPtLrcqQVBLF7tnBW3ACKF2qdO_kJOJ0kVQSYBk_09Eg>
    <xme:Hu4dapyTDluyT0dxtnKsHcDfmWdjwvvAAvpBnpN2GlO6XdrLC6vB8XTbm-GeP0ued
    X2HNgp_SPx3sK2BQVHpg0AiGnz2LIdll0Dt2bXA0IkRy1XvS3plok8>
X-ME-Proxy-Cause: dmFkZTEWdFgTB/a1EXR3n+DHCYsPeOwAGlI+f8u79hdOcqaflmwEeLZ1XGHgmFWttt+yLl
    28v+hhkpCjDuPdg8e3sQCJIFAYRgvKylemfqi7r2EndfBrv77oQ761C8xrLxhbeE+bsj3v
    TAenEDXvx2nQb4tY5PRUA58yTAG3LmV010UwgUlS/zhZeQPEmMGY8GVZty4umkqG84s6wV
    /L21+tj8B7pJETB8vf3StkS1r9gJW2gT4lRLyM/iWee2QmOanodV9tBi0rtYwl4lieewA3
    Jgxe3xna1N13P34L2ZoRWsfcDF1drjOcp/nrzht/m+l/rgibXh2Sw232MZUXNNiR/+ygeh
    p+2osWEICOTvadAp0J719ZmHqIBBPG1uLN+VQDVUS45UZdrT7FcQ1hFJ21yu0P249Ksi+J
    du9ZH5kzIVvlYZMQoJVbKTw+ZysC/e5K097K+PmYKOUh6prURNcGf24T3CK7etiK9oTN7I
    xbhTxyn0OPMDQzV8bZlI++UKbB1kM0+LCtlFH+SMFiozU01nBtjjoyIMWiB7RabwOrIcrp
    +Y8LFMBqD9Idfbky47MtZ9NMKuHAjXv2FeODy1lGn9Gdc1gI2Qv32IDwzdNeoWbNtDSw+/
    TC2C+jdqZe4qYJdgT8+DdA2np6Pnb9QqvJYCSETaStdo5swfYGGXmR9G344A
X-ME-Proxy: <xmx:Hu4daoLQ1r7PyBecGvbD4ACeaWlpnHjX_mhbIrryyn-0OFEKKbniVg>
    <xmx:Hu4dav4Wbh24UZSe8vSOc5m8rmFs5QdXHFITSIdDmYHnu_hpUSVv4g>
    <xmx:Hu4darx5EVHhn5L3ySn-rSQJTr7yl14WalxrnvcrYOsVgsZTPbu5Og>
    <xmx:Hu4dajY-sYO5JrkP6OYj4IqXzEVDbXeD3ZffW9szLm8c3ctasYKUrA>
    <xmx:Hu4dau3_QYW4vzGe_FBIbLwNgMJvOhYcLwAhl_TjfUjJCuA--XgG6311>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EFA1C182007A; Mon,  1 Jun 2026 16:39:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AXmBUbiQg2Mg
Date: Mon, 01 Jun 2026 22:39:36 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Michal Simek" <monstr@monstr.eu>, "SoC Team" <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Message-Id: <b56b09af-cd0a-4061-8cce-5e8a50033b4f@app.fastmail.com>
In-Reply-To: 
 <CAHTX3dKWE6DOPLXPq31wRiXfjac0TVqSOAOLP8itHoGYpF9eBA@mail.gmail.com>
References: 
 <CAHTX3dKWE6DOPLXPq31wRiXfjac0TVqSOAOLP8itHoGYpF9eBA@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: AMD/Xilinx SOC changes for v7.2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, May 29, 2026, at 12:15, Michal Simek wrote:
> ----------------------------------------------------------------
> arm64: Xilinx SOC changes for 7.2
>
> firmware:
> - Add CSU register discovery with sysfs interface

I looked at the contents here, and I'm not too fond of adding
low-level register access interfaces to firmware drivers,
that is usually a bad idea because it ties the interface
to a particular platform.

I have no idea what 'CSU registers' are and the ABI
description does not really explain that either.

What type of userspace would access those, and why can't
this be done in a portable way?

> zynqmp_power:
> - Fix race condition in event registration
> - Fix shutdown and free rx mailbox channel

No objections here, though they look like bugfixes that
may be 7.1 material. Up to you, but don't be shy about
sending things as bugfixes when they address real
problems, it's better than waiting for the merge window
and then immediately asking for a backport.

      Arnd
