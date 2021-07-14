Return-Path: <SRS0=F2nd=MG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA30C07E9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 16:39:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34F9F60725
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 16:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34F9F60725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z7XzvY8BhP+tlF27uVNfcpH2B47TjfQCAK/VmFtcYJc=; b=ORFYeSCORE5Nsi
	co3fYIlOjLzvTJBfLKY/Siv3f8PISj3n9ep2yxQP5tz3ox7KaoYDNdO2nPosWgZWPCdBkM3icZ3Nr
	gL8/BeJEghKv0fQ6lLjVwTTa8jpzajOk01sby2NKihaG0lCVfgrPkCDuOxHRMabwl/szZ8LfWAH2E
	lBtwCe8/BORpDeRQUtwfDz2IeLvTEvnZYLQB4v/JJ5iXqDF55myAGA5lLVYzCwpGFn5PnQpWynuto
	aClpE8rnLN/D/PrGviMaPDgxjURrf0yPMYXM923u2PJNTCnE5oanyBmd49WivLypIqbn15Fl9k5p1
	zJXkLLZqA++NJ8h51v0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3htE-00E6jc-KE; Wed, 14 Jul 2021 16:37:40 +0000
Received: from mail-io1-f45.google.com ([209.85.166.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3htB-00E6iP-3T
 for linux-arm-kernel@lists.infradead.org; Wed, 14 Jul 2021 16:37:38 +0000
Received: by mail-io1-f45.google.com with SMTP id z9so2842201iob.8
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 14 Jul 2021 09:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4tJeunAnZHlhQuigtds/Y0c5fgwGRcJ1HpFKTFeZvbU=;
 b=WzSWuAuss4CpLx6dj4GQ4JLlQfGG8GHGCT08THp3Cd/YjTJkV35dqUeZXXuZy/qKvw
 v4l+Km8qdg6ngT2lwKGVul64OT21AwtnHtHNrjD7LsXy4xdrc4b2hZOR6IyBXv8nWp8T
 DVotBKEPhvHq6XXcB0r+uSmjfx2kgGFZoRKIxdxXKjTO1l0p6ctCrk/4fIMJlZ6hQlFn
 iPgj+YbVbEJ7e97D415T25J01dCkdQFxkdyl761nV/y4BAfw7kGpWKeyF3ONlcQKrt5E
 s1cB0KPODpSi8dvo9W6z9FKf/2T1PQi/Q7GYaSP21Oy+Ujt0QFFxOKgy1/oR5OH8+ftA
 NzbA==
X-Gm-Message-State: AOAM531o8QG9l37LCac7AZpeQxj4Qp2d7VB2VVW7DfcNLoTQca+cmASe
 rnV+OGlKLLVxP01uVqYlpA==
X-Google-Smtp-Source: ABdhPJzVkkc1P8a634IL2iHsgXQyZ4AE005dkCM4T2KN3A+q4PdX0vgxBSC65J1kRJPnYNA0vZBkvg==
X-Received: by 2002:a02:a595:: with SMTP id b21mr9600496jam.122.1626280656051; 
 Wed, 14 Jul 2021 09:37:36 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id c26sm1446889ioa.32.2021.07.14.09.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 09:37:35 -0700 (PDT)
Received: (nullmailer pid 2719952 invoked by uid 1000);
 Wed, 14 Jul 2021 16:37:31 -0000
Date: Wed, 14 Jul 2021 10:37:31 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, soc@kernel.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Olof Johansson <olof@lixom.net>,
 dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2 2/4] dt-bindings: vendor-prefixes: Add an entry for
 SKOV A/S
Message-ID: <20210714163731.GA2719790@robh.at.kernel.org>
References: <20210714045349.10963-1-o.rempel@pengutronix.de>
 <20210714045349.10963-3-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210714045349.10963-3-o.rempel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_093737_186796_7274EC38 
X-CRM114-Status: GOOD (  14.11  )
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
Message-ID: <20210714163731.lPEjNdrNxdkF7EEXr1bfpUoyIMF4M94mZMlohxY238E@z>

On Wed, 14 Jul 2021 06:53:47 +0200, Oleksij Rempel wrote:
> Add "skov" entry for the SKOV A/S: https://www.skov.com/en/
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
