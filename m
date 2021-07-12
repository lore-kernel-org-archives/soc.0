Return-Path: <SRS0=GWmK=ME=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DE9C07E99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jul 2021 20:13:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FB9F60FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jul 2021 20:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FB9F60FF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1xrnkzMTSoV1wwTMNQbydzAg0lkE/0OvuemGlfECKTo=; b=a7E5VUJIlLXEho
	IG8g/Uu2TmHSUDXFOfb/Ff9FsLjz23I8qCsHxDW0WX1xEPaGX27kOmLCgx0TaxhgGsR4HPFiu4R3M
	6r1AkuONRZOoF+f2v1Ued2QcYulCAl3eyo3ORf7dgIHFRiyuR29FczZJ15j4VHJDmN3bSbxhA9laz
	IWwKJvlzY8oDMjufOJW4Xas6stUankXTUoupFM32aJ3HKEZfw+ja3TQL+tDq2/rbHLOTvlhkXFdVu
	1aUK8bVsvrmsCeAns6TSCAaUSQhgFKe8kJyzhUBxzDqd+OTnob0aVX8yWr71mhcgkTWRGbV1ttW9Y
	8lRqqJbQvs7s7Ga3LXZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m32HI-008Lei-EP; Mon, 12 Jul 2021 20:11:44 +0000
Received: from mail-io1-f52.google.com ([209.85.166.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m32HF-008Ldx-8y
 for linux-arm-kernel@lists.infradead.org; Mon, 12 Jul 2021 20:11:42 +0000
Received: by mail-io1-f52.google.com with SMTP id h6so24292261iok.6
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 12 Jul 2021 13:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gQIGOfZ9xP5XhtIaQ8VkC7v7sAXj1rbJpx/JTLj7+aU=;
 b=SlhktjOZ5d83Rk0WNTJLijz7CtgWdVuEt7QPLzaTTQvILFCPyDP85jFVFm2gWzU9fq
 1d5u3oHSMuwYVtpmqwnwUNeol/aQLz9+nDEXd2JeyB3WjMZNA1+KptUQ5Leoej21YrUS
 UA4nJDYBcvoqzrFMqUc/uxMLUttGgL89fsAth+gok8ruoGhv8AhDbYBm5qiE4QgOEX2g
 EWJxK/wrNZK5RRc+lzbWqPmQ7UhzNKrTFBfVve/0qoyyPxoljQpiJ0fyr2vqBgYW00tA
 CYuZ1lDnW3BG+Y//MZJrKGROsLOKKmAXB9+sjF8WCt9ZCuJfkyn3Kr//3DMV7V1msSM8
 rb6w==
X-Gm-Message-State: AOAM533qa/G8Bz35Nv8K4qJeODpzT2Y7rqkvhp/XDU6SQs4Uxbnlyzgk
 KkV+0Y6nzqdGcgqoXqCMYA==
X-Google-Smtp-Source: ABdhPJxcpniyee6ILry/QHvrQ2OrFoTqoJfCa4tRWk9rFnfjHgLdXRmDbFPnrRFUxSH4jTF723x4ew==
X-Received: by 2002:a05:6638:264e:: with SMTP id
 n14mr640343jat.71.1626120700117; 
 Mon, 12 Jul 2021 13:11:40 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id w13sm8749396ilh.39.2021.07.12.13.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 13:11:39 -0700 (PDT)
Received: (nullmailer pid 2408076 invoked by uid 1000);
 Mon, 12 Jul 2021 20:11:36 -0000
Date: Mon, 12 Jul 2021 14:11:36 -0600
From: Rob Herring <robh@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, olof@lixom.net, devicetree@vger.kernel.org,
 ulli.kroll@googlemail.com, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 robh+dt@kernel.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: add vendor prefix for edimax
Message-ID: <20210712201136.GA2408046@robh.at.kernel.org>
References: <20210618205533.1527384-1-clabbe@baylibre.com>
 <20210618205533.1527384-3-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210618205533.1527384-3-clabbe@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_131141_355978_3299A0C9 
X-CRM114-Status: GOOD (  10.74  )
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
Message-ID: <20210712201136.5AUePyPBwhx7mfHr1O9Tsh6WLg253nRrvt61xlwzvvU@z>

On Fri, 18 Jun 2021 20:55:30 +0000, Corentin Labbe wrote:
> Add vendor prefix for EDIMAX Technology Co., Ltd (https://www.edimax.com/)
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
