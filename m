Return-Path: <SRS0=GWmK=ME=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A3FC07E99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jul 2021 20:13:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED8EE611F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jul 2021 20:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED8EE611F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zkq+Y+Ci0/NTILicJ7oeHObGipks4fpLHul82HteInU=; b=dWXTZ0sQjUnXaR
	w8z8AUBDgHBgVD/m+9Td22RVjxswtQTXnM3DbuFAIZ1tnKZC2B1YuklLQraI2WeKcIA8BvtbdPM4a
	83LTAQmpruQ7E9N13xnkRcAl78pXaxF+MIzJEb9t91JPOPjhl8Pdw6fmhCWSpmwGCgQpkHepRMoty
	asT/CO3mFcQqcqf7Q2V8DxodUeOlHGLYsGnZ65uhqUiosR5+vhA3XVWySBGiUnAirO7ghM0O2ZFZh
	lKTPgAIhLTtptQmfUCUz4FXYfOXA6OX2XgTs/0OzMLEuJD/MGksZ62bwVmZfsAVB0Y0k25cGBflvB
	JZ4aO8qxGL3gKAcxoCng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m32HW-008Lh4-08; Mon, 12 Jul 2021 20:11:58 +0000
Received: from mail-io1-f54.google.com ([209.85.166.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m32HQ-008Lfp-Fj
 for linux-arm-kernel@lists.infradead.org; Mon, 12 Jul 2021 20:11:54 +0000
Received: by mail-io1-f54.google.com with SMTP id k11so24285693ioa.5
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 12 Jul 2021 13:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OxPIiCu8t6BRcFmXlg/qwdKH0Oy9r4vjSImMHgxaBOg=;
 b=XpCv2DFUYufuL8HbFxNA6OFEimnRy23TEKu3hBj6eOBDhrjf4xhVs4GH6tqrMzHo1w
 /zxLfAk2CGct736nZaW1OpKCbiqd7xdKdXag1vsXYJQrde9qdXBHZJy81UyaJj+mh5P+
 NbXtilqQt9mqIRfx4B5UdPWowwMQdxSuyTiP0D8JK/XtIwTQbvZs2xLtJGrELSB3ljQX
 LlKScVTYo1ea2/u4XKGnZ2wTrTzDgz/ThfQmcwFtKf6BA2SiukHxXEPLeG1ImtBTLTSj
 jAn6P3psRmDs+hNEXUTqzytk0MQ/tOo9dxO+FrsKiBYA0YLNHRK0QxOPwI8na7j2+k2y
 umHg==
X-Gm-Message-State: AOAM533WG7wV4xRIVM+Y1RUlcFr/v74mgIDrZpJgDrR2JxDkC9Iy7LVU
 qi+47o7qFnGxQjBECKiylg==
X-Google-Smtp-Source: ABdhPJzW6AFfFMICizJP5QMZjYZ9nJPabK3GBmxZyX2c4V5/uCYFdnz9UEb+6IfxFpZC/aQOCQm8sQ==
X-Received: by 2002:a02:ca41:: with SMTP id i1mr657291jal.70.1626120711261;
 Mon, 12 Jul 2021 13:11:51 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id b25sm8792990ios.36.2021.07.12.13.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 13:11:50 -0700 (PDT)
Received: (nullmailer pid 2408523 invoked by uid 1000);
 Mon, 12 Jul 2021 20:11:49 -0000
Date: Mon, 12 Jul 2021 14:11:49 -0600
From: Rob Herring <robh@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, soc@kernel.org,
 olof@lixom.net, devicetree@vger.kernel.org, ulli.kroll@googlemail.com,
 linus.walleij@linaro.org
Subject: Re: [PATCH v2 3/5] dt-bindings: add vendor prefix for ssi
Message-ID: <20210712201149.GA2408465@robh.at.kernel.org>
References: <20210618205533.1527384-1-clabbe@baylibre.com>
 <20210618205533.1527384-4-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210618205533.1527384-4-clabbe@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_131152_689055_7EF2FAEE 
X-CRM114-Status: GOOD (  10.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210712201149.vhtJamV8cD162ecFy13zUKPBO3n_OUACKL49N6odz2k@z>

On Fri, 18 Jun 2021 20:55:31 +0000, Corentin Labbe wrote:
> Add vendor prefix for SSI Computer Corp (https://www.ssi.com.tw/)
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
