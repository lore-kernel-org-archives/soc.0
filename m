Return-Path: <SRS0=BzVa=PC=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D79EC433F5
	for <soc@archiver.kernel.org>; Thu, 14 Oct 2021 16:46:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8192F61156; Thu, 14 Oct 2021 16:46:51 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49DAA61108;
	Thu, 14 Oct 2021 16:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 49DAA61108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 62-20020a9d0a44000000b00552a6f8b804so8446834otg.13;
        Thu, 14 Oct 2021 09:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ujHcRvCirmqYyP/G9OIlII3v2dI92/qrzyNIDCv4hDA=;
        b=cZiuAk/T1LSKjl/w9HcyvCn6NkBS0IhJxoyXQSHaeIihQQUh5RaQqUruIrRhtfwdFA
         4sym64yxgoE6ujXul9FoFoDsk7z/YF9jwsSFEej0gmBNDj0yTNdLAhX2whzzb5LMLot9
         Bt2P9NZoKSaRn3OtDFSAk2PDRFvuOg4JVp4oNZKXM+kOzqLCzk8YiN9IOkj1bGqoXHJJ
         2ctHQdCXPQjPqZhkVi9dEJY4Blu70S3V5R0vJ8hmHjc1MCbV/Q6vFeq9dQpRd3WqPKwK
         FpagGVMmmnTzhQX+JtgU8jiaz4dDYxa4uQpJsBsVGrsQGgrY17CT3x5Tv1xHAu0eFLxG
         QqZA==
X-Gm-Message-State: AOAM531kjDQORol8PjN9zm+BGbgzOqtcDkEZKVhWqohshZtCqx8U8T9x
	caf6Txy0KYXUb7O+M9OrIQ==
X-Google-Smtp-Source: ABdhPJxVtfNRxyb4DCtNbXuq+R80ABq48UJGCYahUiRCZ8f5QF2NeHuamoz+are7uUC04PrCG01Myw==
X-Received: by 2002:a9d:4616:: with SMTP id y22mr3493410ote.215.1634230010558;
        Thu, 14 Oct 2021 09:46:50 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j6sm532430oot.18.2021.10.14.09.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 09:46:50 -0700 (PDT)
Received: (nullmailer pid 3518479 invoked by uid 1000);
	Thu, 14 Oct 2021 16:46:48 -0000
Date: Thu, 14 Oct 2021 11:46:48 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UGF3ZcWC?= Anikiel <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
Cc: jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com, p.zabel@pengutronix.de, arnd@arndb.de, olof@lixom.net, soc@kernel.org, dinguyen@kernel.org, p.yadav@ti.com, Tudor.Ambarus@microchip.com, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, alexandre.belloni@bootlin.com, sre@kernel.org, thunder.leizhen@huawei.com, Jonathan.Cameron@huawei.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ka@semihalf.com, tn@semihalf.com, jam@semihalf.com, amstan@google.com
Subject: Re: [PATCH v2 2/4] dt-bindings: add bus number property
Message-ID: <YWhe+NfiY0l0ILrA@robh.at.kernel.org>
References: <20211005143748.2471647-1-pan@semihalf.com>
 <20211005143746.xE5rCkt-P_XlNkn9bJ8ZqYPY4nQQ7doqzSd4FrAlICY@z>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005143746.xE5rCkt-P_XlNkn9bJ8ZqYPY4nQQ7doqzSd4FrAlICY@z>

On Tue, Oct 05, 2021 at 04:37:46PM +0200, Paweł Anikiel wrote:
> On SoCFPGA systems, it's desireable to have fixed numbering for
> i2c busses, while being able to enable/disable them (e.g. have i2c1
> be mapped to /dev/i2c-1, even though i2c0 is disabled). This can also
> be achieved using devicetree aliases (see i2c_add_adapter). However,
> having the driver be self-contained without relying on aliases is more
> robust.

Your header is a bit weird as you have 2 Message-IDs:

> Message-ID: <20211005143748.2471647-3-pan@semihalf.com>                                                                                                     
> X-Mailer: git-send-email 2.25.1                                                                                                                             
> Message-ID: <20211005143746.xE5rCkt-P_XlNkn9bJ8ZqYPY4nQQ7doqzSd4FrAlICY@z>                                                                                  
