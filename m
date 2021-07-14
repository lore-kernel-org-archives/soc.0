Return-Path: <SRS0=cWqL=MG=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DEEC07E9A
	for <soc@archiver.kernel.org>; Wed, 14 Jul 2021 16:37:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B474D613B6; Wed, 14 Jul 2021 16:37:36 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B44E613C0;
	Wed, 14 Jul 2021 16:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B44E613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-io1-f48.google.com with SMTP id l18so2903443iow.4;
        Wed, 14 Jul 2021 09:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4tJeunAnZHlhQuigtds/Y0c5fgwGRcJ1HpFKTFeZvbU=;
        b=NtMbetGp4xMtMy42zIS4N50QrsUIhKIeiXkUyQfAS9HE8yVcv2j37BSj+3QPpw2C4d
         /HJspJavyjs0xGWOoFMsWtlpnCQKAu6/UZjdB/fQ/+FB9Yi09wvzSXjvLkrkz/sUX9R1
         XFs4Y/5yQ1skDLttALSlJz+feTO7a6dRj1Z2W0uWT7Hr1cXV8ZwglKrrBbVbPZJ84LwT
         j0R6td3RE6hElp1vWVDBCaIufyK+MdZPe9Rz8L5VvCmV9ydVjD9hwDbqmqe5kzNgXRiu
         zMxZFylREuSeaoOpp6BgT8qPYEF99yPc0TeRUYlXu6jto+mDDo0L5PenBr/kUwxZuXK9
         eE7Q==
X-Gm-Message-State: AOAM532gn7zvJYtn/645zVTMMBRkTnRLXNW1CyIngxcInT4qe08hoO/i
	cYDsclOG5QxTqRBii1LM7w==
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, soc@kernel.org, linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Olof Johansson <olof@lixom.net>, dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2 2/4] dt-bindings: vendor-prefixes: Add an entry for
 SKOV A/S
Message-ID: <20210714163731.GA2719790@robh.at.kernel.org>
References: <20210714045349.10963-1-o.rempel@pengutronix.de>
 <20210714045349.10963-3-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714045349.10963-3-o.rempel@pengutronix.de>

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

