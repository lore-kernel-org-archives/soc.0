Return-Path: <SRS0=+Tuv=TT=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6F0C433F5
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 14:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 63EE2C340EF; Tue,  8 Mar 2022 14:30:24 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E20CFC340EC;
	Tue,  8 Mar 2022 14:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E20CFC340EC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1646749824; x=1678285824;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3I7h0SPnRNHJN/A0zJs4vnfUZEdCiODpER7aHfiYxvc=;
  b=0vggYASpHRiCn9QxNjjA0DIUVRRD5uwBoqZ+FFP9YDvxMXaYJVF8A9kd
   U4m4IcC7dwxb1cJC2UNJl5LcXW5fGVqA31soqyTlkgFLwYEDCnbIcDjPn
   hMbgwYlQsjEQNWQJoxiI5jAJclGBUOaxGVI/ZQcKKl7c0nkb6Zkzm0yOl
   RJ906yfhGeSICaTxek8PWnJyrR0DuyF5HVEnMd12hXgzb9FuR6SWEjt1d
   RsE6fFz6g7T0x4nAzcRlvFSYVsLCFKKclZoOQi2G3HjAqIio1aePdbtYW
   gwsTHhsEng5nIKL1otMJTltUKVfiBVv3G4QF51XNjodp5lYAVQ3/sU54g
   A==;
X-IronPort-AV: E=Sophos;i="5.90,165,1643698800"; 
   d="scan'208";a="148476309"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Mar 2022 07:30:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 8 Mar 2022 07:30:20 -0700
Received: from [10.12.73.60] (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Tue, 8 Mar 2022 07:30:16 -0700
Message-ID: <99029bae-cf1b-c3c1-004e-8a6795d19f7f@microchip.com>
Date: Tue, 8 Mar 2022 15:30:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 13/14] ARM: configs: sync multi_v5_defconfig from
 savedefconfig
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
CC: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Rob
 Herring <robh+dt@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>, Icenowy
 Zheng <icenowy@aosc.io>, Jesse Taube <mr.bossman075@gmail.com>, Giulio
 Benetti <giulio.benetti@benettiengineering.com>, George Hilliard
	<thirtythreeforty@gmail.com>, DTML <devicetree@vger.kernel.org>, Linux ARM
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	Russell King <linux@armlinux.org.uk>, Olof Johansson <olof@lixom.net>, SoC
 Team <soc@kernel.org>
References: <20220307143421.1106209-1-andre.przywara@arm.com>
 <20220307143421.1106209-14-andre.przywara@arm.com>
 <CAK8P3a1FxfZj0=T=cvLNfagP+c_d+SEYYuV30+-UTU+B+HVXmQ@mail.gmail.com>
 <20220308120750.0bbe0122@donnerap.cambridge.arm.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20220308120750.0bbe0122@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/03/2022 at 13:07, Andre Przywara wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Tue, 8 Mar 2022 10:38:37 +0100
> Arnd Bergmann <arnd@arndb.de> wrote:
> 
> Hi Arnd,
> 
> thanks for having a look. I was a bit unsure about the policy of those
> changes, so glad to have the discussion.
> 
>> On Mon, Mar 7, 2022 at 3:34 PM Andre Przywara <andre.przywara@arm.com> wrote:
>>>
>>> Some Kconfig options have changed, some other platforms have been
>>> removed.
>>
>> Please split this up into logical chunks: list the platforms that were removed
>> and remove only the lines corresponding to those platforms in one patch,
>> do functional changes in separate patches each with a reason for doing them,
>> and cleanups (moving lines to match the savedefconfig output, removing lines
>> that are now the default) in one final patch.
> 
> Actually this patch is meant to be only about the last past: to sync
> multi_v5_defconfig with the output of "make savedefconfig". .config stays
> the same. I initially tried to chase down the reason for each line change,
> but gave up quickly, because it becomes tedious to learn about this,
> especially about symbols that got *removed*. Also Kconfig is somewhat
> sensitive, a single "select" or "default" change in one random Kconfig can
> affect the result of savedefconfig.
> 
> As I noted in the commit message, the .config does *not* change as a result
> of this patch, the whole purpose is just to make the next patch clearer.
> 
> So I can try find the reason for each removal, if you like, but I am not
> sure that's worthwhile? It is my understanding that Kconfig changes tend
> to accumulate cruft in the various defconfigs over time. In U-Boot we gave
> up on reasoning, and just regularly sync the output of savedefconfig over
> to the *_defconfigs, to keep them minimal and meaningful.
> 
> And I found Olof's commit 30b10c77837c ("ARM: defconfig: re-run
> savedefconfig on multi_v* configs") as a precedence for this kind of cleanup.
> 
>>>   CONFIG_AEABI=y
>>>   CONFIG_HIGHMEM=y
>>> -CONFIG_ZBOOT_ROM_TEXT=0x0
>>> -CONFIG_ZBOOT_ROM_BSS=0x0
>>>   CONFIG_ARM_APPENDED_DTB=y
>>>   CONFIG_ARM_ATAG_DTB_COMPAT=y
>>>   CONFIG_CPU_FREQ=y
>>
>> These were not removed, what happened here is that 'savedefconfig'
>> no longer produces the lines because they now match the defaults.
> 
> Yes, I understand. Is there some policy here, for instance to keep
> those in, for clarity?
> 
>>> @@ -159,7 +151,6 @@ CONFIG_I2C_ASPEED=m
>>>   CONFIG_I2C_AT91=y
>>>   CONFIG_I2C_IMX=y
>>>   CONFIG_I2C_MV64XXX=y
>>> -CONFIG_I2C_NOMADIK=y
>>>   CONFIG_SPI=y
>>>   CONFIG_SPI_ATMEL=y
>>>   CONFIG_SPI_IMX=y
>>
>> This one is still there. Not sure why it's no longer enabled.
> 
> It's not in the current .config. From what I can see, it depends on
> ARCH_AMBA, which is selected by ARCH_NOMADIK, but that one is not enabled
> by multi_v5_defconfig. Not sure if that is an oversight, or a change, a
> the dependency is bogus, or something else.
> 
> If you find that useful, I can try to find those dependency chains for the
> other options, but I definitely lack the knowledge about the history of
> those old platforms, so I can't reason about them. But I could present you
> the findings and you can then say what to do?
> 
>>>   CONFIG_REGULATOR_FIXED_VOLTAGE=y
>>>   CONFIG_MEDIA_SUPPORT=y
>>>   CONFIG_MEDIA_CAMERA_SUPPORT=y
>>> -CONFIG_V4L_PLATFORM_DRIVERS=y
>>> -CONFIG_VIDEO_ASPEED=m
>>> -CONFIG_VIDEO_ATMEL_ISI=m
>>>   CONFIG_DRM=y
>>>   CONFIG_DRM_ATMEL_HLCDC=m
>>> -CONFIG_DRM_PANEL_SIMPLE=y
>>> -CONFIG_DRM_PANEL_EDP=y
>>>   CONFIG_DRM_ASPEED_GFX=m
>>> -CONFIG_FB_IMX=y
>>> -CONFIG_FB_ATMEL=y
>>> -CONFIG_BACKLIGHT_ATMEL_LCDC=y
>>
>> This doesn't look right at all. If you want to disable graphics support,
>> please do that in a separate patch and explain why we can't have those
>> any more. Are you running into problems with the vmlinux size?
> 
> As I mentioned, the .config didn't change at all, so those options are
> already not included in mainline anymore.

As far as I'm concerned and only talking about the drivers, I would 
prefer that we keep the following config options activated in the .config:

CONFIG_VIDEO_ATMEL_ISI=m
CONFIG_DRM_PANEL_SIMPLE=y
CONFIG_FB_ATMEL=y
CONFIG_BACKLIGHT_ATMEL_LCDC=y

The question to know if they are activated by default or not and if the 
associated stack is selected or not, well... I lost track of this, sorry.

Regards,
   Nicolas


> AFAICS, those last options depend on CONFIG_FB, which isn't enabled. Is
> that a regression due to the recent fbdev changes?
> 
> Cheers,
> Andre
> 
>>
>>>   CONFIG_LIBCRC32C=y
>>>   CONFIG_DEBUG_INFO=y
>>> -CONFIG_DEBUG_FS=y
>>>   CONFIG_MAGIC_SYSRQ=y
>>> +CONFIG_DEBUG_FS=y
>>>   CONFIG_DEBUG_KERNEL=y
>>>   # CONFIG_SCHED_DEBUG is not set
>>>   # CONFIG_DEBUG_PREEMPT is not set
>>
>> This should probably go along with the ZBOOT_ROM change, it's
>> only cosmetic.
>>
>>          Arnd
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


-- 
Nicolas Ferre
