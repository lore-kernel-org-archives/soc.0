Return-Path: <SRS0=AN8N=JS=baylibre.com=khilman@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0FBC433B4
	for <soc@archiver.kernel.org>; Wed, 21 Apr 2021 20:44:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AA9CF61428; Wed, 21 Apr 2021 20:44:46 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72B0661425
	for <soc@kernel.org>; Wed, 21 Apr 2021 20:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72B0661425
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=khilman@baylibre.com
Received: by mail-pl1-f175.google.com with SMTP id u7so20524022plr.6
        for <soc@kernel.org>; Wed, 21 Apr 2021 13:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=LqeeZgChcK3wdcOs4dDdba7xt3RLZI12xLEaMRltL8w=;
        b=ANQIhEfici6n+E6aXWErlQi26kq9j670L8srhMDBeURjitFFDdhjOPd4qFaIAEd0Wt
         OK2Ha/hO4tO5fvrDPp8l0TMsGY9JxrxRnGxmamGYVm+rWckLnv3T6nv2I34VUd3jMbwE
         Lo9qQaSooYIfOEjwciBHI0tSqaWzcs+4d1emK0JEBzTjzAItXs6pHGgDLlRh6Htotocm
         6f5gdolPfDSFXLn3YVC+9/WIY1wtztG3nHnlxDvjg9HRqGD+B84Mdb1SFHCN8d6PVn6+
         944QCofIedp+MZ1h/sJO07hF8i+W16Y5RadTZ9QxeLd1F3/rCh2/ncLmU+yI7rs8Bsnw
         zkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=LqeeZgChcK3wdcOs4dDdba7xt3RLZI12xLEaMRltL8w=;
        b=TTpZzXQ1vdUKpJqaIH1uz/zGQIl7Z18u6l6QEIyKdKQ5MN58ct7T9RiKeqdjpozz2B
         b9ICkdbrAtyzwvx4kbbLZkilRTHlMter1wQUpjywSM9yUgLZAsSTc/+9SslHTqUOsPvo
         jfM5TQWNtXOFvHQeYBLgeOlhECXgVDI4pw7DPasRFfvlJVMbTJKkbQzooni0wkSaNj+R
         r9chhOFv+7z6EMmLVW6EAxdKZIcehHIUKTekVsF2AXphMI3510S1K7HYlGBpZZXKiCC/
         kpkwPxyobevWo6gGAicuq2Tlm5Ox88qbTjESeK4Gtj6Qra1bBZZIKbgZ5kyOM1TOTNs5
         9suw==
X-Gm-Message-State: AOAM532bDWumj+5GsEnfnLOrlfs2JF735VEVgskOJQ72Qp5Z1uiQJ9HR
	xGLDQpyQy4pQD+Vs+R+tdeRXqw8YNuroaKWO
X-Google-Smtp-Source: ABdhPJxIxAXLVcAkfgmjFPBmQheFcOxGtvyZBWfr+pibd0xIENT7Dp7m40rQgH4lvmHqtOYRBWSvGA==
X-Received: by 2002:a17:902:d3d3:b029:ec:ce64:a8ad with SMTP id w19-20020a170902d3d3b02900ecce64a8admr108381plb.68.1619037884784;
        Wed, 21 Apr 2021 13:44:44 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id t184sm244636pgt.32.2021.04.21.13.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 13:44:44 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, SoC Team <soc@kernel.org>,
 devicetree@vger.kernel.org, "open list:ARM/Amlogic Meson..."
 <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH] arm64: dts: amlogic: misc DT schema fixups
In-Reply-To: <CAL_Jsq+Z2Mxy_m1QpqgFi0M7DGqMYUwZhrgk_CP7Vy1frAzUcA@mail.gmail.com>
References: <20210420230402.8807-1-khilman@baylibre.com>
 <CAL_Jsq+Z2Mxy_m1QpqgFi0M7DGqMYUwZhrgk_CP7Vy1frAzUcA@mail.gmail.com>
Date: Wed, 21 Apr 2021 13:44:43 -0700
Message-ID: <7hmttrbc5g.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain

Rob Herring <robh+dt@kernel.org> writes:

> On Tue, Apr 20, 2021 at 6:04 PM Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Take a pass at cleaning up a bunch of warnings
>> from 'make dtbs_check' that have crept in.
>>
>> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
>> ---
>>  .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |  5 +++++
>>  .../bindings/media/amlogic,axg-ge2d.yaml           |  1 +
>>  Documentation/devicetree/bindings/media/rc.yaml    |  4 ++++
>>  .../devicetree/bindings/sound/amlogic,t9015.yaml   |  1 +
>>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  4 ++--
>>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  | 14 +++++++-------
>>  .../arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts |  2 +-
>>  .../boot/dts/amlogic/meson-g12b-gtking-pro.dts     |  4 ++--
>>  arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts  |  2 +-
>>  .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |  4 ++--
>>  .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |  2 +-
>>  .../dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts |  2 +-
>>  .../boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts |  8 ++++----
>>  .../boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts |  2 +-
>>  .../boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts   |  2 +-
>>  .../boot/dts/amlogic/meson-gxm-wetek-core2.dts     |  2 +-
>>  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |  4 ++--
>>  .../arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts |  2 +-
>>  18 files changed, 38 insertions(+), 27 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
>> index 184492162e7e..db2240bad012 100644
>> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
>> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
>> @@ -69,6 +69,11 @@ properties:
>>
>>        where voltage is in V, frequency is in MHz.
>>
>> +  dma-coherent:
>> +    description: |
>> +      Present if page table walks made by the SMMU are cache coherent with the
>> +      CPU.
>
> Copied from the SMMU binding whose definition is a bit special?

Oops, yes.  A mostly blind copy/paste.

> Just 'dma-coherent: true' is good.

OK

Kevin

