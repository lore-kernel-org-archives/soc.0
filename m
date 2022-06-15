Return-Path: <SRS0=8zmq=WW=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E34C43334
	for <soc@archiver.kernel.org>; Wed, 15 Jun 2022 03:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EC76BC341C0; Wed, 15 Jun 2022 03:42:13 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 32B5FC34115;
	Wed, 15 Jun 2022 03:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 32B5FC34115
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id u2so10291683pfc.2;
        Tue, 14 Jun 2022 20:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=prqwfBB8IBeBJ+JyWKDneA2kE9eg++b9GYF5VWJbagg=;
        b=ON4Db6pPQ726uO51uQ0gs+usU3f8o9ySSJuGgyGQBJzHnaT/EWoV8JOFA4YniATOCy
         K3ld8Q2fdu4HAwWC0YpLhx2G0jGgvEJeSWJZk5kjMuBS1U/Kb7qapDo0LERh7cv2eNTK
         Sg4exoGtOaJxXnYKgvutpKE4RsXWOIzPz/tTR7Zs9Xc883ldQEGoKwsh9y8XxYXWsyWE
         tPFYwVR7lrW5BOvBtMmVL8bQmty4lxs01R97nVt2FsofImRvrtvmDPPrhDD2HhcyEnW1
         Nk7P2Z5JzZplrfgOwsAxnWB/fPQibzgIUXXWvHMEQioAhe6HgOuDnXt3r422u/l82TEG
         ZSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=prqwfBB8IBeBJ+JyWKDneA2kE9eg++b9GYF5VWJbagg=;
        b=cq8bXvhq3Uzd92+I5NCkSp5GECzop4cjgl2VdRpFPQ3ahOXSqmg9ZKF4XBQM493CZ8
         GNEVpiarUG1ucmC7UZWqFZm7at4SLUhVagBI7kHTYO5Xkn/++poSKH7TqP5sYVg5bQa9
         WTqjNAh2EtxvCsxoVu1PW3lofHDZdKHohpveXnwiPxIFjOZLgcxYTpO2Kce7eo35lekr
         dcIkugieMQ3FboMNUhWRmlIZbh8/2CQ0iFaLBCwDkuubHGz6+FFo8gk0+7vmrVugYPST
         relWxDG2sQ+6MG/48bNakSAlZKFLiFWrElKxgHz5ji2SrbJluAEsdoDakXDfYhmCZ7wG
         /JMA==
X-Gm-Message-State: AOAM5324BZiOqcx4mNjVSwZx/HHfN6AVmhqdIj8zv8cq1eVfnNEyK8t3
	MnhSm/bdkMNtz6ducnUATW8apSoBej7R1g==
X-Google-Smtp-Source: ABdhPJz3piDHI8my8kCFXgZqH5Vl0mtNkDZQRwW/U/BOfpBAspuma032Tjb7jpUWY55OtBMby0QHlQ==
X-Received: by 2002:a63:111a:0:b0:401:b6bc:6f8e with SMTP id g26-20020a63111a000000b00401b6bc6f8emr7029391pgl.163.1655264532511;
        Tue, 14 Jun 2022 20:42:12 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id cp5-20020a170902e78500b00163f5028fd6sm8051129plb.5.2022.06.14.20.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 20:42:12 -0700 (PDT)
Message-ID: <de40d63e-b01d-d25b-e7a2-e54d5b5bcddb@gmail.com>
Date: Wed, 15 Jun 2022 05:42:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [GIT PULL] firmware: arm_scmi: Fixes for v5.19
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>, ARM SoC Team <arm@kernel.org>,
 SoC Team <soc@kernel.org>, ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, Olof Johansson <olof@lixom.net>
References: <20220614100007.1029881-1-sudeep.holla@arm.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220614100007.1029881-1-sudeep.holla@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 6/14/2022 12:00 PM, Sudeep Holla wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> -->8
> 
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>    Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-5.19
> 
> for you to fetch changes up to 44dbdf3bb3f44bf08897ed5f22eb262edcf3d926:
> 
>    firmware: arm_scmi: Fix incorrect error propagation in scmi_voltage_descriptors_get (2022-06-12 19:59:55 +0100)

Looks like "firmware: arm_scmi: Add SCMI v3.1 protocol extended names 
support" introduces the following splat which is not fixed by the 
commits in this pull request:

[    0.603737] ------------[ cut here ]------------
[    0.603752] WARNING: CPU: 1 PID: 1 at mm/page_alloc.c:5402 
__alloc_pages+0x6c/0x184
[    0.603797] Modules linked in:
[    0.603809] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 
5.19.0-rc1-g44dbdf3bb3f4 #42
[    0.603818] Hardware name: BCX972160SV (DT)
[    0.603825] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[    0.603834] pc : __alloc_pages+0x6c/0x184
[    0.603841] lr : kmalloc_order+0x40/0x88
[    0.603851] sp : ffffffc00a40b850
[    0.603856] x29: ffffffc00a40b850 x28: 0000000000000000 x27: 
ffffffc008d60404
[    0.603867] x26: ffffff80c1e3e1a8 x25: ffffffc00877bd78 x24: 
0000000000000058
[    0.603878] x23: ffffffc0081921a8 x22: ffffffc008cb04b0 x21: 
0000000000000000
[    0.603889] x20: 000000000000000b x19: 000000000000000b x18: 
0000000000000000
[    0.603900] x17: 0000000000000001 x16: 0000000100000000 x15: 
000000000000000a
[    0.603911] x14: 0000000000000000 x13: ffffff80c1e3c20a x12: 
ffffffffffffffff
[    0.603922] x11: 0000000000000020 x10: 0000000000000880 x9 : 
ffffffc008159dac
[    0.603932] x8 : ffffff80c02708e0 x7 : 0000000000000004 x6 : 
000000000041a880
[    0.603943] x5 : 0000000000000001 x4 : ffffff8000000000 x3 : 
0000000000000000
[    0.603954] x2 : 0000000000000000 x1 : 0000000000000001 x0 : 
ffffffc00a32d3f2
[    0.603965] Call trace:
[    0.603970]  __alloc_pages+0x6c/0x184
[    0.603977]  kmalloc_order+0x40/0x88
[    0.603984]  kmalloc_order_trace+0x30/0xd0
[    0.603992]  __kmalloc_track_caller+0x64/0x19c
[    0.603999]  devm_kmalloc+0x5c/0xe0
[    0.604009]  scmi_voltage_protocol_init+0x14c/0x2f4
[    0.604020]  scmi_get_protocol_instance+0x128/0x1f4
[    0.604030]  scmi_devm_protocol_get+0x64/0xc8
[    0.604037]  scmi_regulator_probe+0x5c/0x42c
[    0.604049]  scmi_dev_probe+0x28/0x38
[    0.604056]  really_probe+0x1b8/0x380
[    0.604065]  __driver_probe_device+0x14c/0x164
[    0.604073]  driver_probe_device+0x48/0xe0
[    0.604080]  __driver_attach+0x160/0x170
[    0.604087]  bus_for_each_dev+0x78/0xb8
[    0.604095]  driver_attach+0x28/0x30
[    0.604101]  bus_add_driver+0xf4/0x208
[    0.604108]  driver_register+0xb4/0xf0
[    0.604116]  scmi_driver_register+0x5c/0xa4
[    0.604123]  scmi_drv_init+0x28/0x30
[    0.604132]  do_one_initcall+0x80/0x1a4
[    0.604141]  kernel_init_freeable+0x220/0x23c
[    0.604149]  kernel_init+0x28/0x128
[    0.604158]  ret_from_fork+0x10/0x20
[    0.604166] ---[ end trace 0000000000000000 ]---
[    0.604194] scmi-regulator: probe of scmi_dev.2 failed with error -12
[    0.604792] arm-scmi brcm_scmi@0: Failed. SCMI protocol 22 not active.
-- 
Florian
