Return-Path: <SRS0=A4Es=PU=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 970E2C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Nov 2021 23:36:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6984E6052B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Nov 2021 23:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6984E6052B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pVva4YN+qap/O8z5bZiKar6UX+yb5CLOBmZw0a7yd8M=; b=r6ocda2XJ+GiSC
	E1hFu3ZdT5leo/Yzh0BKrBAzRDkODIUeqoQcGe8NOO1AvfZrmxubG0c0KAwjPRyMjPVq7tMFnYo1j
	3zHf5Td0B7D2NoKrDrrrc7oFhNxD/SxsKwDCXlHyBIs5Ir+yJGc+yfiC5+6qPYUCkvO1YnRO/YC1e
	jRIQ91Ln7TPTWZHKdlsq+FNbNwmOo+fftG69mTtC1/inT2AX9qsRypQzu4CobbCZl+StBDWWb7nTf
	GYmvjG0iuuZ0F49h8WOFZ+ovyQXN7E1zsZoxWYdj4gE1VjcKol8+ntcgBKCg8XJR3KSjVPXKOfcMo
	NImbwhpsypWC2aPIIZWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhgpM-00HZU8-Ce; Mon, 01 Nov 2021 23:34:56 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhgpI-00HZSM-NC
 for linux-arm-kernel@lists.infradead.org; Mon, 01 Nov 2021 23:34:54 +0000
Received: by mail-qt1-x82d.google.com with SMTP id o12so6661020qtv.4
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 01 Nov 2021 16:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Qe/jf30Y3o/pmc26ACLNjuS8JmQeoQQ3eNfoksRErqQ=;
 b=meyqyUd/ZQyFTlOFbpQmDWQBblRqcdcrSUKWso+9ZuYNublXe/ZttCH0W4VdQjJwSG
 7/EPsTeoo+WkMvDC1cOTQjJh7gVZUABjpKsY7SR6uFh8yqsrjAHIEBIX3Km5Dsq2Y+Ob
 SnDXPeVMXiO8jugBR67Bvhix80sc4zcO6KoiCYVhtCPTi39BnakPo5MFx7jaH3l2URmb
 Sh5+SyCQh3qIHa4JXkxf2XNrNcb6kUwjxzMGOk+cfaCRwkATpuom1R4bdlBRZYTiXQoA
 dTZlLZpdj9KfLY13M8iqYjkn14dAB6fqmNENU9JlJlivYefautnTK/6H6Qdb8vZnDXL7
 wKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Qe/jf30Y3o/pmc26ACLNjuS8JmQeoQQ3eNfoksRErqQ=;
 b=zMbI66eeP7JisNZU4EtCt6w1DFwswg86eP7g2QAZ0VPY7Vwj1CpJ3rsKvFeUqt/RWa
 z7YtITtL4EBXXBe/xqGJg/oxH3oNTWNDv4nyoF70ezgjn0xLb2BCrejdjoT7Eold4OnN
 pahyIWbPdxLWIjQHHwMxoM2mMrykV9SUPL9X3Z/jFZA/bk88DmiyWAtmKK9lb8gl+zCR
 O7ZIf0laU7LkcMvKpyjGajvBhRgkJYaL3QHu28OPTOfvlrK3sfsEJjbDAqFCxJTiAH2n
 TkUQUMsvY7U5nOEBJOHTzG/mRfMqDeOHco0jPNfNxTe8inPcFWW7zdi+o0sNGrx3fZXQ
 x0Kg==
X-Gm-Message-State: AOAM531XvFfISmMEdMU1SC7ZI5PkwbIOLjsHRg7cqNGMJPnstp8nip1/
 gPHgPZ8P6eUejAnK51lJ+ck=
X-Google-Smtp-Source: ABdhPJzszAm1hNUhWdNj2F3b33eIBAlQhcRdClkzaW2WFdJoN9bdZELkbTvPnuJLuvdKLmw9qyoaWg==
X-Received: by 2002:a05:622a:54a:: with SMTP id
 m10mr27961206qtx.239.1635809690756; 
 Mon, 01 Nov 2021 16:34:50 -0700 (PDT)
Received: from [10.4.10.38]
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188])
 by smtp.gmail.com with ESMTPSA id m6sm11260918qti.38.2021.11.01.16.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 16:34:50 -0700 (PDT)
Message-ID: <58e5ec6a-7b85-3935-f859-6670600ac6a2@gmail.com>
Date: Mon, 1 Nov 2021 19:34:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 08/13] dt-bindings: serial: fsl-lpuart: add i.MXRT
 compatible
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
 stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org,
 arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk,
 abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org,
 giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp,
 leonard.crestez@nxp.com, b20788@freescale.com, fugang.duan@nxp.com,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <20211024154027.1479261-9-Mr.Bossman075@gmail.com>
 <YYBKh1KYrWTzm+5G@robh.at.kernel.org>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <YYBKh1KYrWTzm+5G@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_163452_811607_D78AD701 
X-CRM114-Status: GOOD (  16.73  )
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
Message-ID: <20211101233448.QIkUo5jlZ2-QnCDouCjv2rU0vSkSe-bLv0xxIY38uuM@z>



On 11/1/21 16:13, Rob Herring wrote:
> On Sun, Oct 24, 2021 at 11:40:22AM -0400, Jesse Taube wrote:
>> Add i.MXRT documentation for compatible string.
>>
>> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
>> index a90c971b4f1f..4b4340def2aa 100644
>> --- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
>> +++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
>> @@ -21,6 +21,7 @@ properties:
>>            - fsl,ls1028a-lpuart
>>            - fsl,imx7ulp-lpuart
>>            - fsl,imx8qm-lpuart
>> +          - fsl,imxrt-lpuart
> 
> Actually, 'rt' is not a single part is it? If the variations are same 
> die, but fused off then no need to distinguish. Otherwise, these should 
> be SoC specific.
> 
I don't exactly know what "but fused off" means I would assume
disconnected but on-die? The imxrtxxx is a series that has the same UART
controller across them. Should I add ACK?
> Same applies to other compatible strings.
> 
>>        - items:
>>            - const: fsl,imx8qxp-lpuart
>>            - const: fsl,imx7ulp-lpuart
>> -- 
>> 2.33.0
>>
>>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
