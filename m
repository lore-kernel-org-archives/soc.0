Return-Path: <SRS0=2LUn=GY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DCEEC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 09:37:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C2D02395A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 09:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C2D02395A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HYdqXNk1yraMuLrHsNzwhOhLkSIoXvnBm8lZcDVve1s=; b=emEUzJG9iUhWG2DWtvmvQua0I
	CP0I9dhkiEeqGon92kdXlW4R4Ac2BWhrSMPHtaCz9ruBkRjv5KiFO3cTrWKgO/s3cODqL0z93ZPgo
	Re8XGOhLtNmB3BG6xeQ2BEINgNMlhLDoZf7hDCg2LgMpoQJiKBNitGLBad+qG/RxyYXnsgsDK6k9X
	XEBd+Sn75bNuzZX5xglYPhbUTr+rDpp5Y/rK5C9g86S2DCACbrvL6OnuLDVBySr67lUVWk2qJ+7CH
	Mo25DWRiiqqz+13gH0A+cQSJUje9Twaa1110d04rKpK3pYVjPpkKK7my+axZy6CB7qGzaq1hRRsmt
	ZVmDjGQyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2WNQ-0006y0-Iv; Thu, 21 Jan 2021 09:35:40 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2WNM-0006xA-Ci
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Jan 2021 09:35:38 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id CEAD822F99;
 Thu, 21 Jan 2021 10:35:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1611221728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+gbRSGE0nWUH9bFF7dDE4htsRr0J7rGI/rc6n7Svmns=;
 b=EtcfjVUJ/wecaAdfo5GWmzWJ/1iDt9eeRVDeuJIB9jb/dFWT0aaye6XcrKNyeAhs/5OgQF
 eY/5crAqpcbBLXDVQzBN31uB/o89bl8O5WQA6Nrm45mZGdKGUjhgxxreCMucxkqiT9rb+K
 B3zVORwDZnBhII5cLn0YRZKKqEyiWdg=
MIME-Version: 1.0
Date: Thu, 21 Jan 2021 10:35:27 +0100
From: Michael Walle <michael@walle.cc>
To: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 0/3] add Ebang EBAZ4205 support
In-Reply-To: <fff420d1-fc9a-23ce-0d07-58a3c6f10c4d@xilinx.com>
References: <20210120194033.26970-1-michael@walle.cc>
 <fff420d1-fc9a-23ce-0d07-58a3c6f10c4d@xilinx.com>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <aa96fcaa362181d4b6fef9f1de0aa914@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_043536_547142_9E05AB9D 
X-CRM114-Status: GOOD (  16.65  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210121093527.dRY0EZxAqvG8gEoVUZGiPcZ5wsmQppabX6I66PvsH9A@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
