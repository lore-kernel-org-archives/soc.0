Return-Path: <SRS0=fsuH=GY=walle.cc=michael@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1BDCC433E0
	for <soc@archiver.kernel.org>; Thu, 21 Jan 2021 09:35:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BBB522395A; Thu, 21 Jan 2021 09:35:33 +0000 (UTC)
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B0CB2388E;
	Thu, 21 Jan 2021 09:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B0CB2388E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=michael@walle.cc
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id CEAD822F99;
	Thu, 21 Jan 2021 10:35:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1611221728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+gbRSGE0nWUH9bFF7dDE4htsRr0J7rGI/rc6n7Svmns=;
	b=EtcfjVUJ/wecaAdfo5GWmzWJ/1iDt9eeRVDeuJIB9jb/dFWT0aaye6XcrKNyeAhs/5OgQF
	eY/5crAqpcbBLXDVQzBN31uB/o89bl8O5WQA6Nrm45mZGdKGUjhgxxreCMucxkqiT9rb+K
	B3zVORwDZnBhII5cLn0YRZKKqEyiWdg=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 21 Jan 2021 10:35:27 +0100
From: Michael Walle <michael@walle.cc>
To: Michal Simek <michal.simek@xilinx.com>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org
Subject: Re: [PATCH 0/3] add Ebang EBAZ4205 support
In-Reply-To: <fff420d1-fc9a-23ce-0d07-58a3c6f10c4d@xilinx.com>
References: <20210120194033.26970-1-michael@walle.cc>
 <fff420d1-fc9a-23ce-0d07-58a3c6f10c4d@xilinx.com>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <aa96fcaa362181d4b6fef9f1de0aa914@walle.cc>
X-Sender: michael@walle.cc

Hi Michal,

Am 2021-01-21 10:25, schrieb Michal Simek:
> On 1/20/21 8:40 PM, Michael Walle wrote:
>> Add support for the Ebang EBAZ4205 board. This board was once used as 
>> a
>> control board for a bitcoin mining device. Nowawdays it is sold as a 
>> cheap
>> Zynq-7000 eval board.
>> 
>> Michael Walle (3):
>>   dt-bindings: add ebang vendor prefix
>>   dt-bindings: arm: add Ebang EBAZ4205 board
>>   ARM: dts: add Ebang EBAZ4205 device tree
>> 
>>  .../devicetree/bindings/arm/xilinx.yaml       |   1 +
>>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>>  arch/arm/boot/dts/Makefile                    |   1 +
>>  arch/arm/boot/dts/zynq-ebaz4205.dts           | 109 
>> ++++++++++++++++++
>>  4 files changed, 113 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/zynq-ebaz4205.dts
>> 
> 
> any link with schematics?

https://github.com/xjtuecho/EBAZ4205, looks like these are
reverse engineered (from a layout file?) though.

> I will let dt guys to comment 1/3 but series look good to me.
> The board doesn't look interesting from description point of view 
> that's
> why all the time thinking if makes sense to add it to kernel.

What do you want to tell me? That for the time being, it didn't
appear to you to add the board yourself - or do you thing it
doesn't make sense at all. If its the latter, what would be
actual reason to have a board in mainline?

-michael
