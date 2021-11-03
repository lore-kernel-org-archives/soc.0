Return-Path: <SRS0=8DV1=PW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9862AC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Nov 2021 01:40:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57087610E8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Nov 2021 01:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 57087610E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jDLJlwjypNl/OPIhIDqohhs/G+78g2yKhrXnVj4oQaA=; b=o6tXB7mjqIWwp+
	/o7pC9BEkZwN/oDxNDyfbYbkjl8wvhfiFv/fNCIw8lhPCvzJ0LFILBmeyZ53T0j2ap45p/Y1X6bdk
	Cte/RL9hibX6Cqfp5YMjJl73ee5BlmPEzzARBUEfHy4OaDQAyAlxdpdQ32RHCcNUkQBQMG71mfRWv
	PtIirSUBr7GUCkI3tFAi7ZtTqByGDegsTkMTTzJz+H/V9tfKVWnEs+B5oA6vVZ0qBAmGII6qs/WGT
	0j73joa5QXVE+zv1pj19EC2Vk6aGZ1qr/A1+psx1S0eqXuLbFkZvEluRaqaMi8CmiX9KKNf1r3ThO
	sDgMReCAdKFuLs1ZLskA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi5EZ-003nDH-FV; Wed, 03 Nov 2021 01:38:35 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi5EV-003nCM-Ch
 for linux-arm-kernel@lists.infradead.org; Wed, 03 Nov 2021 01:38:33 +0000
Received: by mail-qk1-x733.google.com with SMTP id r8so888318qkp.4
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 02 Nov 2021 18:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OBY5Q24oLCdJiOFQ4Wr4G9n2vhczi/whcGNmMalBbcU=;
 b=YIDvTcrGObzuJqxdvsrmYDalL+NMUy2YJ2A/rGqD7QWdc8XetgFNilP0M++GiV1ywn
 zju6V6GNC5N/0usDG51SNtkxpBBd9f/2lsBWAc5lGTkKuxPMkhq9s3WMWXKA0Uwh3JmB
 pP20qwVc0hU0nwbBcSe2TI5BVODnNh+12KqC4fk/li661vjfh8tdcfC2Pauot+y1dCKx
 ARcDtbNpwUcVi1gyb8Mt+IJVoRoauhfA37IcnJQLocIBfKbC96EJAHA5fe5J3I6hE6q4
 ouI6OLjWWqBaQY4lBvOpjUJ7k4BO6yMEfefAoWsUZW7Wjj5yUbYquXQf3wvNO87GZXHO
 V7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OBY5Q24oLCdJiOFQ4Wr4G9n2vhczi/whcGNmMalBbcU=;
 b=wVXVlt5UAuf6KBxiDM75Mn2+pnx+LbpqeFCgAPeM7YJiwBSB23o4Vh/vCYewPEpmtC
 1hRBDJ0HS9eBDX9v7hKN8L3eUz3Bq1A/cOz/R3G9h2Z2V0rwooAMMzNw7GCLwHvyTx/9
 ng8UVoXKBn+zBX4i9Fhg8OqADKFcCtgGh4B8fCKmAZiGYrlzeW2O6/zEs7/U6/pHBIa1
 8zhu8KDWSIMnLrk4Roccr1pT/0j2jgdooB/3YG9kGykFoHffrTbXSc82/OdbcXXG/kTB
 cG5lsne5HetUCDZae+g/aknhddW2x7Ht3OyjwWIqHUl9uzMYttKRhXCzygXEbkF1QBNH
 3rDQ==
X-Gm-Message-State: AOAM530faZ5cdhTnkG+8vmRLK4Vgrm9e7BpH1p5thenf2/RdBTyrpt/p
 WBsQddXDAHPcpiBMhZtg76Q=
X-Google-Smtp-Source: ABdhPJw7RUY/tEZEerSqMNS7jwE9g8ZmJdoZ7rmhME/TSctr8N0uqrySZo031wybo7Vm+WaLIaLHDQ==
X-Received: by 2002:a37:660f:: with SMTP id a15mr4332943qkc.73.1635903506846; 
 Tue, 02 Nov 2021 18:38:26 -0700 (PDT)
Received: from [10.4.10.38]
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188])
 by smtp.gmail.com with ESMTPSA id c3sm577825qtx.53.2021.11.02.18.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 18:38:26 -0700 (PDT)
Message-ID: <c97c45ac-d9d6-a21b-9c43-69f58b07f265@gmail.com>
Date: Tue, 2 Nov 2021 21:38:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 02/13] dt-bindings: pinctrl: add i.MXRT1050 pinctrl
 binding doc
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: mturquette@baylibre.com, aisheng.dong@nxp.com, linux@armlinux.org.uk,
 s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, adrian.hunter@intel.com,
 linux-mmc@vger.kernel.org, kernel@pengutronix.de, shawnguo@kernel.org,
 linus.walleij@linaro.org, linux-serial@vger.kernel.org,
 jirislaby@kernel.org, robh+dt@kernel.org, abel.vesa@nxp.com,
 festevam@gmail.com, ulf.hansson@linaro.org, linux-kernel@vger.kernel.org,
 stefan@agner.ch, olof@lixom.net, sboyd@kernel.org,
 nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org, arnd@arndb.de,
 devicetree@vger.kernel.org, linux-imx@nxp.com, soc@kernel.org,
 gregkh@linuxfoundation.org, giulio.benetti@benettiengineering.com
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-3-Mr.Bossman075@gmail.com>
 <1635902437.626178.3880384.nullmailer@robh.at.kernel.org>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <1635902437.626178.3880384.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_183831_474324_F064FCC1 
X-CRM114-Status: GOOD (  20.21  )
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
Message-ID: <20211103013824.hA33KBiqQfDApHTgEOvjl0ZXUguPV2fV0boghgB6PRQ@z>



On 11/2/21 21:20, Rob Herring wrote:
> On Tue, 02 Nov 2021 18:56:50 -0400, Jesse Taube wrote:
>> From: Jesse Taube <mr.bossman075@gmail.com>
>>
>> Add i.MXRT1050 pinctrl binding doc
>>
>> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
>> ---
>> V1->V2:
>> * Replace macros with values
>> * Add tab for last pinctrl value
>> ---
>>   .../bindings/pinctrl/fsl,imxrt1050.yaml       | 83 +++++++++++++++++++
>>   1 file changed, 83 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
Ah I thought it would stop make at error i see it now, is there a way to 
do one file.
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> ./Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml: $id: relative path/filename doesn't match actual path or filename
> 	expected: http://devicetree.org/schemas/pinctrl/fsl,imxrt1050.yaml#
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.example.dt.yaml: iomuxc@401f8000: 'fsl,mux_mask', 'imxrt1050-evk' do not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.example.dt.yaml: iomuxc@401f8000: 'pinctrl-0' is a dependency of 'pinctrl-names'
> 	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/pinctrl/pinctrl-consumer.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/1549987
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
