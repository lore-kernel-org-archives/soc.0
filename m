Return-Path: <SRS0=8DV1=PW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED62C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Nov 2021 19:12:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2778761101
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Nov 2021 19:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2778761101
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8uFjQSmj78GpXjufyLqGNnAvH/nRD5Q4n6o05AYYXI=; b=c24kkJTULrIR6EWikeiQwZxmqw
	6ahDSUx0FEuuct0wdGIruU+KKDhxR1n2ju+nMJbvJcFF74hrYZeYULj9IkbK+0l2/q70ybcOIIcR3
	Ch5bHwPp0BK0X0aASH2qgH/IskfMAdhPLfwtfG8i4tzr5OmxwWvIESHORSGnVtJOeZ7/mk1VcYXwn
	WfC6x1qM0B1htW2LwPLvGJizQTIczJj1tMRqXC3GybHNjaB3EPOdjtVLjeHMOc0Gamb7HaqnMm4sT
	aFe7uV8yM9QcGX/Vs0dRZlJuFP8IpDdUveZRPN/MJyYtBWz7zop9iqF3aDGzQJ7uNHYrNQOJAnhl2
	iCpPeNww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miLet-006MhD-Ql; Wed, 03 Nov 2021 19:10:52 +0000
Received: from smtpcmd0756.aruba.it ([62.149.156.56])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miLeo-006MeR-Kp
 for linux-arm-kernel@lists.infradead.org; Wed, 03 Nov 2021 19:10:48 +0000
Received: from [192.168.153.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id iLehmQUVD4n4riLehmFuEJ; Wed, 03 Nov 2021 20:10:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1635966644; bh=0/31yxmO9a/oC0P8HSIAOi7F4D8XhUglntlI8cyweIg=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=JHt8XzSjYLi1rWyUyi2ykyjLwTWrBHdvKgItGaNHY9vgQDx4CIXQIBALXxgxMWPRM
 oGtbjIF7McsY1X/k1uP2Acdeqw2BIas+OYupr81C2Dcca7XMa2Vp0Sp0FJTrwpcsSX
 gFRfNMSc4dWtlo/n9+z2VXPjPRkCSC59N3R0G8+8JwmsfgviQHXTaF7kvRBJuWubei
 hx+F0V/WiqGSUyEdMZ1mqAWtMsH7ZhpC7rP9NDKtvKOajBIDiWHDZJL7lyTxdyUfDg
 n4sufjnQVMtJZjMUz4pfih0uAXT2MavO/91P0GGzNZ/d33kaReBHi5j6jAzzW4d6FZ
 +cACDqCxUK6YQ==
Subject: Re: [PATCH v2 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for
 i.MXRT series
To: Fabio Estevam <festevam@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Jesse Taube <mr.bossman075@gmail.com>, NXP Linux Team
 <linux-imx@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
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
 <5ebe48f5-7b9c-be99-d50c-65a056084b96@benettiengineering.com>
 <CAOMZO5DHCYaxzSASKq6Bk8ALkiQeVjPOHOyk-pKYepJFJk6oFQ@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <78cba8ec-72b0-89b8-d6e3-09ecea19ca7b@benettiengineering.com>
Date: Wed, 3 Nov 2021 20:10:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAOMZO5DHCYaxzSASKq6Bk8ALkiQeVjPOHOyk-pKYepJFJk6oFQ@mail.gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfF6/WWjL7PJeZTTfz9UiWozyugqncNHx9tTkfwkkeDbnl31INXrmdyJqCSDLjNgQNAiX+KEFaL/glNmQk4hLNz+e91vJZFmZ3NF5I4POniLdU+133jcp
 XzXAVa/DOc7iJ7Umt9dQCiK70yv+dPSCm6DyvEHh3sPzUmjoblvN2rbQedLd/KRav15zduP3h7pa3TBT7GXnqFDja1xM10FZDIRnNyWpakY0+K6IpWr9CtRp
 RbGD2bB0eWYl2pgQ6oK7rgqwkfBiXt6WBqx32YZalbWMiwFTgFZXYFX2bhI4iGNXtHbYX6M7a2P6awc9yt+RpNOC46ceA2OSF2GD2nNLCCA85tkJbOLpIuW+
 2qJ4tYuOUeifsY8fJ1OAWVgvpme4hq+Jn9KOnjeL9hMJkqLhKlMoFBWG4ZFAjx6P+T/WjW84919f5FBekomjfNlXPtI2bx8LowHcHVMxxtgWKrIy8/HCjQse
 hMtGvQbiPuqHqMSGKMU0Q3721Q7hTJXFuObQDrhcRED7Kw6KTtE+Aczv5xnK+GZFMBgayrKg+SPoimBROvDme87huk7quiukeu+sSdj2ldoS4sJzD14db2fG
 fUZGCElF1aWolDYn3zDRnuI9aNLyzS3y1bYpg51QmCdVikiJpSb9nuEDd32x1YmU5g6bp8wj6JvNaeEdLN+hZ8C98TiPIvfIAQlyjNyu4rl6AtSJkRa0xbkl
 Oqwe2dhAY8fi/AdyGAOTkGT9EcPX6i/VjPEh3HGAOLI7lQRyq0Do61LOcfvBUvIvN4UdwfKqBwD9s9EPIMQEYbN3mTdK+1FUVYNZBAwyyypuvn/FOjtDyP2H
 JMyFerHaBWkngEyHrqz25mjCOQMODTDTsNvvVliBq93lDPsgK3mJEl0Habe+NGvFA2p8EJtf0FwLgL0DRkJHzdhMV88ocFN+5a1+J0RrGZr4w1tABUN/5cm1
 WudLVrZSILp4LPugdLhbdtWqzTVqLr7Z5bwjuyY0ykWP1Okhj8x8edAs9QHPcNhSXogZq6iiuo5o1gC6xSOGhsYvQsVxL3miS8s3fPyG/QjEvDLLBWrnRyF1
 0glwqRkuoJSHoK/FA3aAdIQ9Aeg2lDGEs3pbsWIwLor0bSAzNFFlUwrWmx7Z5ykPs8sZoNMAWTJRAnNPRjzG87S0dPFSboLuLSo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_121046_929253_C5CF8F4C 
X-CRM114-Status: GOOD (  19.00  )
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
Message-ID: <20211103191039.TwX9LXgbAlDmYDU0mk7u_YDnoCU39NazVh6MA-Ca9x4@z>

Hi Fabio, Jesse, Rob, All,

On 11/3/21 6:51 PM, Fabio Estevam wrote:
> Hi Giulio,
> 
> On Tue, Nov 2, 2021 at 8:30 PM Giulio Benetti
> <giulio.benetti@benettiengineering.com> wrote:
> 
>> If we add every SoC we will end up having a long list for every device
>> driver. At the moment it would be 7 parts:
>> 1) imxrt1020
>> 2) imxrt1024
>> .
>> .
>> .
>> 7) imxrt1170
>>
>> Is it ok anyway?
> 
> As this patch adds the support for imxrt1050, I would go with
> "fsl,imxrt1050-usdhc" for now.
> 

Ok, then it's the same as pointed by Rob for lpuart[1]; @Jesse: we will 
do the same for all peripherals(more or less) since it seems there are 
little differences in the i.MXRT family.

[1]: 
https://lore.kernel.org/lkml/D0A3E11F-FEDE-4B2D-90AB-63DFC245A935@benettiengineering.com/T/

Thanks a lot
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
