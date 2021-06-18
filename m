Return-Path: <SRS0=1/go=LM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8127C48BDF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 21:08:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7648D61261
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 21:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7648D61261
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rwn8ezXnQZoGjTiWzr61eu5MR/HbtXHl5h1eK0AxjcI=; b=4pBNrUFjsSMRkR
	5hayqhsWXmhw1iYXv0DB7V87wgbfxZ1mhK8o5d9aelFYmbWWoeJenidMilWnjSZE6HRWNvHAUk1GS
	aYNLQBTn03uIK58tlXNQsMxLVGhsgBWqZGXwkHJH/tZKL3XSbpRi20jW5R9KrMMd8RHTbJXr3ikf1
	YJf8xMKtVpoauAkJHrDdDCwKl6y4qW43bA0w2eUGj2dq75dZjt8YAzbl/UxHg2sYnNSw621sqpmoi
	tfRq4/udm+HwFgYbXV5LTTtbctOeq9FEp/kIWCJkvBaKhJCif3ZKgCHIUZn6O6nWf+fJuF/aALyAO
	Bc+p26cTbxSMNCgmR1jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luLhN-00FXPW-5W; Fri, 18 Jun 2021 21:06:45 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luLhI-00FXOJ-UN
 for linux-arm-kernel@lists.infradead.org; Fri, 18 Jun 2021 21:06:43 +0000
Received: by mail-oi1-f179.google.com with SMTP id x196so11963281oif.10
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 18 Jun 2021 14:06:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w7lyGyrFAML0Yig1eUfs9PBn3aotrCMVHhnAEEshvHs=;
 b=tKMeBHvUzMSKQof5660g9PM88LCnHCmVHxr3mL//DzJKKVZfbhPQxOCSRN2kNo8oab
 Rxn8cNo56F91yPvwyqdPnMKLfrOYmdaNFc+lWpYuLK9y1OR8bqK+KwFZjo8u1eDZzF/U
 OkJZd1hjoAPdV2TMsTEklegkXAutEFrUgIWdo9wGVI1+GbsyKuaJjhqnXOz1/onsGK4G
 EAmtqGnRXuj+sCVnLXu0AfbXUEMQ7nHs0Wbf3C8QVyBhbvmH+g6P6RYKVacVydWlRjoI
 PspNZCe6ojfSXwOUECqUw6i5zyRbt4uoM1XWQ2G/zjtDeP41xumoDa8xAZA3ORIPboWg
 u/ww==
X-Gm-Message-State: AOAM532qpGJGTZMdTacNJLKXZ6hd89HEoTIzzRZOHxwUdEf1UUOyfvpG
 hTnMvwdlNz006VC8PnLSlg==
X-Google-Smtp-Source: ABdhPJy9BVM8JnW1fklyNIsJf+HjmUAJv6l+X1dfrWJd5kHxG8MZpWxMuP+Z3rmPjas11wLLEtoWDg==
X-Received: by 2002:aca:fc91:: with SMTP id a139mr15981093oii.12.1624050398597; 
 Fri, 18 Jun 2021 14:06:38 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id 129sm2063231ooq.34.2021.06.18.14.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 14:06:37 -0700 (PDT)
Received: (nullmailer pid 2874290 invoked by uid 1000);
 Fri, 18 Jun 2021 21:06:32 -0000
Date: Fri, 18 Jun 2021 15:06:32 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Vetter <daniel@ffwll.ch>, Fabio Estevam <festevam@gmail.com>,
 Olof Johansson <olof@lixom.net>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, soc@kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 2/4] dt-bindings: vendor-prefixes: Add an entry for
 SKOV A/S
Message-ID: <20210618210632.GA2874235@robh.at.kernel.org>
References: <20210609121050.18715-1-o.rempel@pengutronix.de>
 <20210609121050.18715-3-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210609121050.18715-3-o.rempel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_140641_005924_8EB9F670 
X-CRM114-Status: GOOD (  10.31  )
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
Message-ID: <20210618210632.jOYbgfWRnh8gjIkIirfD8yUdPil5LHKPbzZwd9Kkkhs@z>

On Wed, 09 Jun 2021 14:10:48 +0200, Oleksij Rempel wrote:
> Add "skov" entry for the SKOV A/S: https://www.skov.com/en/
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
