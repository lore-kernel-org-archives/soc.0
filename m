Return-Path: <SRS0=YOEr=PV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B5FC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 23:31:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31C7260FC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 23:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 31C7260FC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ArTbhPYNTjM7TzKkxpBf2QEEzeSwIq2S4Q6JmICNQEE=; b=RFzaEkgkuNYB155i++tFBqZcyi
	fPR8VbXeFkWB2fkFeExa7Hplsrn76f/5+1ziBi5tEo8llSymi/T97W2uuSEZ/KJZC0f53xrcceTYc
	Y1sXLGlq4LskNKbxLdbfuKcZN4Wq+WYvzhi1wMSREs8+z7FVDCPbE8MbtB8DJXpGkPvMqpB7F4cfD
	ZbBRvvDLugOVbRibo2drTlKuAP5NBJRcMccauxi/JKg06qvKeCLL+wDRxZIFaVo6z0DwqR2HGGZ8h
	MFQc/JggATDB0nfOdDxJxVYCzEfumC1y7tQvxVM+3BZXbfGAH6IvdCzg4mCt/WMp+5Uxx/Pl4C0CM
	99ugAb3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi3EZ-003Owh-A0; Tue, 02 Nov 2021 23:30:27 +0000
Received: from smtpcmd12131.aruba.it ([62.149.156.131])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi3EU-003OvD-8e
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Nov 2021 23:30:24 +0000
Received: from [192.168.153.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id i3EPm4vnjnxSqi3EPmcRjP; Wed, 03 Nov 2021 00:30:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1635895819; bh=CVH4E3T74mSLJgFr0+2baxsEGjTaCKZhPlnfRz38Urk=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=Uc3Rw42EQnXVNFsK02zGrc5yAf03SDmcFOlh65qeVovEWtu6bUJl1KS4DpEp/bsa0
 yah9gfcPBM25sIoH4/mR1cDwsHndi68rt5bLZo5zWWg6QR05HT2gyMkOPBho5sOF8U
 icDGb6a1G9m+iEtCsAh0MekRLU4M8k3uyWHBvQvMWJ5wSeHcmFFPGTO9nI+xrZRwSo
 B8zZbEj7Gq6xzqwYhvauGB8QC0mO0b9qSN+H7JN3AAJKOidAX2XaE6DoORmkKjeJ7L
 AnMbnC5h9ZU4uRDEPX+uF8nKK4ufX3Qylqi7jaET13hzlxpOIclqXI87zpXfCbcLuk
 4nKLDxdxtl5ug==
Subject: Re: [PATCH v2 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for
 i.MXRT series
To: Jesse Taube <mr.bossman075@gmail.com>, Fabio Estevam <festevam@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sascha Hauer <kernel@pengutronix.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 Dong Aisheng <aisheng.dong@nxp.com>, Stefan Agner <stefan@agner.ch>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Abel Vesa <abel.vesa@nxp.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-clk <linux-clk@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-serial@vger.kernel.org
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-12-Mr.Bossman075@gmail.com>
 <CAOMZO5AxMXxDkNDqGJDhtepqSUxGRCWO+L=c67O==4fx66M7XQ@mail.gmail.com>
 <c1610093-95ae-68d3-57ae-93b1bc9715d7@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <5ebe48f5-7b9c-be99-d50c-65a056084b96@benettiengineering.com>
Date: Wed, 3 Nov 2021 00:30:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c1610093-95ae-68d3-57ae-93b1bc9715d7@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfFF0kMKCgHuPZZdTmE48caZfrYeN7mNuy9LJ5DmgdBa7PMy3yw4JyTgPV4UtB8gv8UWudxmi7EUMA7kBCNVePf5f6/hVKPgKmzEkfqfUXuHzumzwNTLp
 Q1NtqsuDyb1jwU+35ZCycH1OV5YBjAO7yqXi+7RTucxA1jN8hYaocJ2iEX2j/12cfz/5KlEowUfU2CYfZIBfFTZvYm/5/qvdh5Nv6zY8ZrcwxkQBkEoKMoyL
 bRKC6ajuyVQ7LxrOsCTs9UgQyjuKYsSuEMGHsrwoOg2cvS5bBTUtnf2utEFoOu6PTapJnzx8NYfFFCQLTAJytx9m6gzTMyEUsT4WQOpFNg1zIt59njdutT3S
 93mtFCyyLAJqjOPnaH3w1drDngGo6MdWIuTClPsbMpGY0BVurVmkhvGMqkTM6dtJ3EQRuoiz7J8hheiMZPDKjynmKkzCs8T0K0K67cb9N6LlB514im8UFZTy
 E/CyYouaf3y1yMWTOTeh8HU3Z6RtZCuTtbXD6pvCfyzjMJFJ5jWjFgTMhpDuaMwOo6OPmc9COW4NyHhI4fVDxAh1Wh/XLGyVGEzGrO4lsBCTN7DqCTe7lHnA
 UMVCb5huuzONw726B8vJOsk+5pFNwBAk2nnGev7aqPDpMxlcfuw9Rl8QafNXMHkTOGPGv1GVX/xxVP+HVrAilUqes3+OnZ+OOfA7BlrljqbvcsXLreUUmhoU
 +lL/9x7iJAslxzl/zHNgYm0vQbJiVwjKyWYS3c86tZ1PNrrBypxUBKCP1Pjr74ufE4ZeqMWAUYBqxdYZ7kAGloMdFCLVwpybUvQ/Jx7c0ECAtltSthJ8bYG/
 Blm7C9xps0o4nRT6H8AkjuYslA+rAGd8Q/TRv3apW1sAxuoFuMWlKvyZO2KNs8kNlHKfkMeAZ3ubrc+gX59FCUMQvTOM70AUrqBvGgrnmUBtbVRSdUUCWrbX
 6VlMF7RiDy6kWIeRW/skiSnPAdN0cnofXbwR0sBItsztUonf9AudWecAEkZM9mlWu2F43k0/jOmPqN+q3AcstG14vyw3v8F50L3M18jZ3rMw/TjtQU9tQiia
 dJFiLZiiKMQa/hKTfuQHLdPER3G17gr0F7Qu2ijcTqi9STRkj+7jJ1t8w+IWuEmaN0JgC5pcshctaWkITgFAuPNEn81soe4VaNY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_163022_657423_ED0A9C9B 
X-CRM114-Status: GOOD (  18.99  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211102233017.bvZyNHgwkuFX2SrymY1886iySuCFjH3IP1hlSc3HduY@z>

Hi Fabio, Jesse, All,

On 11/3/21 12:25 AM, Jesse Taube wrote:
> 
> 
> On 11/2/21 19:17, Fabio Estevam wrote:
>> On Tue, Nov 2, 2021 at 7:57 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
>>
>>>    static struct esdhc_soc_data usdhc_imx8qxp_data = {
>>>           .flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_STD_TUNING
>>> @@ -357,6 +363,7 @@ static const struct of_device_id imx_esdhc_dt_ids[] = {
>>>           { .compatible = "fsl,imx7ulp-usdhc", .data = &usdhc_imx7ulp_data, },
>>>           { .compatible = "fsl,imx8qxp-usdhc", .data = &usdhc_imx8qxp_data, },
>>>           { .compatible = "fsl,imx8mm-usdhc", .data = &usdhc_imx8mm_data, },
>>> +       { .compatible = "fsl,imxrt-usdhc", .data = &usdhc_imxrt_data, },
>>
>> I thought Rob suggested to use the SoC name, so this would be:
>>
> Uh i think that may have been for the UART.
>> { .compatible = "fsl,imxrt1050-usdhc", .data = &usdhc_imxrt1050_data, },
>>
>> The same applies to the other bindings in the series.
>>
>> This way it would be possible to differentiate between future
>> supported i.MX RT devices.
>>
> This makes sense will do in V3.
> 

If we add every SoC we will end up having a long list for every device 
driver. At the moment it would be 7 parts:
1) imxrt1020
2) imxrt1024
.
.
.
7) imxrt1170

Is it ok anyway?

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
