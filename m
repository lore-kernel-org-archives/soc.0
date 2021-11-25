Return-Path: <SRS0=/X4i=QM=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AD7C433F5
	for <soc@archiver.kernel.org>; Thu, 25 Nov 2021 22:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E2D1C9305E; Thu, 25 Nov 2021 22:19:27 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 65ABCC9305B;
	Thu, 25 Nov 2021 22:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 65ABCC9305B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id 132so12998494qkj.11;
        Thu, 25 Nov 2021 14:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Jzu3IGp/+NtN4KbWEJ7SKM9mTl27O4zRYj7bMTCcrDE=;
        b=OjE3fyUCfvqLCfwTy5oIDirKOGtUiPlm61xh/sjmS8fkEGNT33LdV81wdUB26kbtD+
         o8zIRbchPNkvhSf82WqVy5cR98VkXUL3DUtCs351sPiQsuLzkzpFRBuV+3yPC9MuKi6w
         ztjTUmlFr7zgqMeQbvXhCFSvV9tUHahyGpaVEuposSRCXhJL1BEIHoZfJ9nq99Xa5mL0
         iqlDbGv8MrD6mEQYXgnWOIO7h++bdHD9ETNLZDJhtjpgdzXfMdDeIER6ssS7mJIZveQT
         OHfPxHMFSGuDUT9msVDJ0QMAOhe4RPz9NmE+MFV0Qbx0CrnoTfZL2xlHs1nyTwC7ZpKn
         AOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Jzu3IGp/+NtN4KbWEJ7SKM9mTl27O4zRYj7bMTCcrDE=;
        b=kmSWAUPYkYvfbCkT9iohDNQFq5HPOZ2+VhV+H8iz2VhrFYqitLnLXvjsMOsTKPpwiY
         DXni487P7Rw7rCzuFde9nViNahVeLJtRWfE7tQFQd/hDBy7V3ia4zym40kV/zk0zz2AR
         r3SYc5FmHguHJ74gIB7roQQ5bmJszAUobneBkyEGvdyfmVxrQKppTNRmsBWakZsxc7Zw
         s2yHvYguY1tWddOv+rzoRMDtAxxedgFkLY0uBKj7J4/B9NZ2XoNy0uGGh34e3ZFxKqem
         EnSkdPkGprGpGKwNdx5qhEeXXxKuIMH2WPRMBe/cNvVklL86rhqv3vJbrTMlidL12HU5
         IdCA==
X-Gm-Message-State: AOAM530SPfOdwky/cDtUZWfRCQYk2n7jQaoTTSY28/uaWkN8zqdgnT7F
	3wQVSNAPYB9Dn/wBQ0h9zys=
X-Google-Smtp-Source: ABdhPJxTOSRJIXYg48NDzBO2Igr258AXSKndwwjJmfQt6W5u0VUgTJ2R8cUwxHqE9Pp/9WV8nyLzhQ==
X-Received: by 2002:a05:620a:2955:: with SMTP id n21mr11102232qkp.586.1637878765420;
        Thu, 25 Nov 2021 14:19:25 -0800 (PST)
Received: from [10.4.10.38] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id d5sm2347779qte.27.2021.11.25.14.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 14:19:25 -0800 (PST)
Message-ID: <2801d9c2-f922-5cc7-4e43-c9a8db3004ba@gmail.com>
Date: Thu, 25 Nov 2021 17:19:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v3 13/13] ARM: imxrt_defconfig: add i.MXRT family
 defconfig
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Stefan Agner <stefan@agner.ch>, Linus Walleij <linus.walleij@linaro.org>,
 gregkh <gregkh@linuxfoundation.org>, Olof Johansson <olof@lixom.net>,
 SoC Team <soc@kernel.org>, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Abel Vesa <abel.vesa@nxp.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, giulio.benetti@benettiengineering.com,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-clk <linux-clk@vger.kernel.org>, DTML <devicetree@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
 <20211125211443.1150135-14-Mr.Bossman075@gmail.com>
 <CAK8P3a3dwwBt21o7LDY-CLDdVmOknxDF7sgO_dfiTj8_u4Tx=A@mail.gmail.com>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <CAK8P3a3dwwBt21o7LDY-CLDdVmOknxDF7sgO_dfiTj8_u4Tx=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/25/21 16:42, Arnd Bergmann wrote:
> On Thu, Nov 25, 2021 at 10:14 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
>>
>> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>
>> Add generic i.MXRT family defconfig.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> 
> I see a lot of things in here that probably should not be part of the kernel,
> either because they are rather obscure, or they take valuable memory:
> 
>> ---
>>   arch/arm/configs/imxrt_defconfig | 157 +++++++++++++++++++++++++++++++
>>   1 file changed, 157 insertions(+)
>>   create mode 100644 arch/arm/configs/imxrt_defconfig
>>
>> diff --git a/arch/arm/configs/imxrt_defconfig b/arch/arm/configs/imxrt_defconfig
>> new file mode 100644
>> index 000000000000..d673745a5462
>> --- /dev/null
>> +++ b/arch/arm/configs/imxrt_defconfig
>> @@ -0,0 +1,157 @@
>> +# CONFIG_LOCALVERSION_AUTO is not set
>> +CONFIG_SYSVIPC=y
>> +CONFIG_USELIB=y
> 
> You almost certainly won't want USELIB, and SYSVIPC support
> would only be useful for certain applications that you probably
> won't run.
> 
>> +CONFIG_BSD_PROCESS_ACCT=y
>> +CONFIG_BSD_PROCESS_ACCT_V3=y
>> +CONFIG_PSI=y
>> +CONFIG_IKCONFIG=y
>> +CONFIG_IKCONFIG_PROC=y
> 
> Probably nonen of these are helpful here.
> 
>> +CONFIG_MEMCG=y
>> +CONFIG_BLK_CGROUP=y
>> +CONFIG_CFS_BANDWIDTH=y
>> +CONFIG_CGROUP_PIDS=y
>> +CONFIG_CGROUP_RDMA=y
>> +CONFIG_CGROUP_FREEZER=y
>> +CONFIG_CGROUP_DEVICE=y
>> +CONFIG_CGROUP_CPUACCT=y
>> +CONFIG_CGROUP_PERF=y
>> +CONFIG_CGROUP_BPF=y
>> +CONFIG_NAMESPACES=y
>> +CONFIG_USER_NS=y
>> +CONFIG_CHECKPOINT_RESTORE=y
> 
> Same for control groups overall as well as checkpoint_restore
> 
>> +CONFIG_RELAY=y
> 
> There are a few drivers using CONFIG_RELAY, but I don't see you enable
> any of them,
> so this is not actually used.
> 
this makes scene will change
>> +CONFIG_EXPERT=y
> 
> Are you losing anything without EXPERT? If not, remove that
> 
>> +CONFIG_SGETMASK_SYSCALL=y
>> +# CONFIG_FUTEX is not set
> 
> Futex is probably one of the things you /do/ want.
> 
There is a weird bug in futexs that reads from null_ptr, otherwise if 
you hard code that access isn't allowed it works. This seems to be a 
problem on other no-MMU platforms. I changed it to not have futexs like 
the stm32s, CONFIG_EXPERT is required for this option. If you want I can 
explain more about this but, i was going to do that as a separate patch.

>> +CONFIG_KALLSYMS_ALL=y
>> +CONFIG_PC104=y
> 
> Turning off KALLSYMS_ALL may save a noticeable amount of RAM.
Intresting
> 
> PC104 isn't actually that big, but it seems unlikely that you have
> that hardware.
> 
>> +CONFIG_PARAVIRT=y
> 
> You don't seem to enable XEN, so I don't think PARAVIRT is useful by itself.
> 
>> +# CONFIG_ATAGS is not set
>> +CONFIG_CMDLINE="console=ttyS0 root=/dev/mmcblk0p2 rw earlycon rootwait"
> 
> The command line should come from the boot loader, users probably have
> a different root device.
Presumably this will never be used but I have it there as an example for 
others, I can remove it if necessary.
> 
>> +CONFIG_BLK_DEV_BSGLIB=y
>> +CONFIG_BLK_DEV_INTEGRITY=y
>> +CONFIG_BLK_DEV_ZONED=y
>> +CONFIG_BLK_DEV_THROTTLING=y
>> +CONFIG_BLK_WBT=y
>> +CONFIG_BLK_SED_OPAL=y
>> +CONFIG_PARTITION_ADVANCED=y
>> +CONFIG_BSD_DISKLABEL=y
>> +CONFIG_MINIX_SUBPARTITION=y
>> +CONFIG_SOLARIS_X86_PARTITION=y
>> +CONFIG_UNIXWARE_DISKLABEL=y
>> +CONFIG_LDM_PARTITION=y
> 
> I don't see you using OPAL or any of the 1990's partition formats.
> ot set
> 
>> +CONFIG_BINFMT_FLAT=y
> 
> For the defconfig, you should probably have ELF_FDPIC enabled,
> not just FLAT.
> 
>> +CONFIG_CLEANCACHE=y
>> +CONFIG_ZPOOL=y
>> +CONFIG_ZBUD=y
>> +CONFIG_Z3FOLD=y
> 
> Do these work as expected on NOMMU?
> 
>> +CONFIG_BLK_DEV_LOOP=y
>> +CONFIG_BLK_DEV_RAM=y
>> +CONFIG_BLK_DEV_RAM_COUNT=1
>> +CONFIG_BLK_DEV_RAM_SIZE=65536
> 
> I don't think you can have a ramdisk larger than RAM ;-)
> 
Oh that's funny I left that from testing something I will remove it.
>> +CONFIG_MEMORY=y
> 
> No need to enable the subsystem when you don't enable any
> of its drivers.
> 
>> +CONFIG_EXT2_FS=y
>> +CONFIG_EXT2_FS_XATTR=y
>> +CONFIG_EXT2_FS_POSIX_ACL=y
>> +CONFIG_EXT2_FS_SECURITY=y
>> +CONFIG_EXT3_FS=y
>> +CONFIG_EXT3_FS_POSIX_ACL=y
>> +CONFIG_EXT3_FS_SECURITY=y
> 
> Never use EXT3 on eMMC, just use EXT4 instead to make
> the device actually live longer. You probably don't need to enable
> EXT2 support separately.
> 
>> +# CONFIG_FILE_LOCKING is not set
>> +# CONFIG_DNOTIFY is not set
>> +CONFIG_QUOTA=y
> 
> dnotify and locking seem more useful than quota here
> 
>> +# CONFIG_PRINT_QUOTA_WARNING is not set
>> +CONFIG_AUTOFS4_FS=y
> 
>> +CONFIG_CONFIGFS_FS=y
> 
> I don't see anything using configfs
> 
>> +CONFIG_LSM="yama,loadpin,integrity,apparmor"
> 
> None of these are actually enabled as far as I can tell.
> 
>> +CONFIG_DEBUG_INFO=y
>> +CONFIG_DEBUG_INFO_DWARF4=y
> 
> If you use DWARF4, you probably want DEBUG_INFO_SPLIT as well,
> to reduce the vmlinux size.
> 
>         Arnd
> 
Thx for telling me about this i will try to use only the necessary ones.
