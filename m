Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C0CFC4361B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 16:35:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3C0822BF3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 16:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3C0822BF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UXzQA395x4xqEKATfPBychcfsN0ZnmXrm9YHydwV3JQ=; b=WrfAq2zto8kCOtu2cK1GSZ9dy
	6AqwoCDfjrGr7vAAEFRkDJafx07W9hy+V5vqpLCav7vkfS3Cp/z1LSc7ilzmifZwGGc0VZlpvsn1t
	rvT9J1pQiAjkTn4oTmLedlALqpPsQzb//F7yJ48Oxv87FgGZ0FxgmacorQVMR2a5bl+PkGbXFqD6m
	Mgj4adrIn3EAVVf7hpTAFOpApW3uHBYk0r6PhYPTgQMrpTjNxqju5gKyzcZex3LnnIoXRSMHr7/MW
	52PHYI0OhzRKkGGSgrHNEZEFTYcFtr1F1OGe3Du4ZZa7yLaf7Ciqg8oE7xWoF/dw87psXd9Xlamo/
	DUCRzm8vw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn2Pu-0007hQ-9j; Wed, 09 Dec 2020 16:34:14 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn2Ps-0007h1-B4
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 16:34:13 +0000
Received: by mail-ot1-f67.google.com with SMTP id q25so1925521otn.10
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 09 Dec 2020 08:34:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9amksMRaTre1TKphGMa6RukD/0UXnG4x5MJc8xzPF+8=;
 b=ro8t4SAu2nu3Q6uZB/EaYk7worC1hglBT+Q4IeW6x8MjkvBIlbokGnC2wHMtGCXMov
 btaUVxUvpitceslC+tIvIUGm/jhx1y1LvL55fNVW406gY2sF5V1Z5hRjAx9vGOQx1Po9
 2Iwcx5/NJlIXAufWXd10j+EwvPgWB2R0dz3FTc1yGxq5n8osgxW65eD9aWFDrA2CuLxl
 h7mFUKXuXLIAp9Kdp0z7PaCJYskG3WfnURM7scHTdydyyPM/Hdnhgdzbyq/PYUKvJreL
 xLRJWgICzMcK4iEZWz+K5L3o/9C1QJJzb3tcIXETPqfc33L4+q5vodZ/gJxTjza/3EGU
 VyQA==
X-Gm-Message-State: AOAM531RbXQ4qjq4Q21y36u2X4W1/iBNxrqFKkBoQQis6bNiYEmD71Hh
 zPt6Y7FIMrv5wcecvTBd8g==
X-Google-Smtp-Source: ABdhPJw079OcH9Wx/tOkfeG7V+did7VdjHcLMAldhzxsI94Q/ADO9vhyb7XLabLtHUSZaUYxtlnBlg==
X-Received: by 2002:a05:6830:1011:: with SMTP id
 a17mr2440801otp.97.1607531651586; 
 Wed, 09 Dec 2020 08:34:11 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h2sm480685otn.15.2020.12.09.08.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 08:34:10 -0800 (PST)
Received: (nullmailer pid 567548 invoked by uid 1000);
 Wed, 09 Dec 2020 16:34:09 -0000
Date: Wed, 9 Dec 2020 10:34:09 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Palmer <daniel@0x0f.com>
Subject: Re: [PATCH v2 02/10] dt-bindings: vendor-prefixes: Add honestar
 vendor prefix
Message-ID: <20201209163409.GA566058@robh.at.kernel.org>
References: <20201201134330.3037007-1-daniel@0x0f.com>
 <20201201134330.3037007-3-daniel@0x0f.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201201134330.3037007-3-daniel@0x0f.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_113412_411101_C88BFF11 
X-CRM114-Status: GOOD (  14.52  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
 soc@kernel.org, olof@lixom.net, w@1wt.eu, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209163409.ShbBd_Vf2lXXI1Ymmwlw6W-P0FqwLEFzZm3kHwYwmwg@z>

On Tue, Dec 01, 2020 at 10:43:22PM +0900, Daniel Palmer wrote:
> Add prefix for Honestar Technologies Co., Ltd.
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 2735be1a8470..a6cf2cef6f89 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -451,6 +451,8 @@ patternProperties:
>      description: Holt Integrated Circuits, Inc.
>    "^honeywell,.*":
>      description: Honeywell
> +  "^honestar,.*":
> +    description: Honestar Technologies Co., Ltd.

Alphabetical order please.

>    "^hoperun,.*":
>      description: Jiangsu HopeRun Software Co., Ltd.
>    "^hp,.*":
> -- 
> 2.29.2
> 

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
