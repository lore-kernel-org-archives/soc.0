Return-Path: <SRS0=W/M8=5H=gmail.com=festevam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D77C46467
	for <soc@archiver.kernel.org>; Tue, 10 Jan 2023 14:42:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BB8A2C433D2; Tue, 10 Jan 2023 14:42:48 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E3A9FC433EF;
	Tue, 10 Jan 2023 14:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E3A9FC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id b17so5876394pld.7;
        Tue, 10 Jan 2023 06:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tXjIjnxYMI42IRu4LCReG1Fw+YG7xeYmx7NOLjI+qsU=;
        b=PGQPByQ8cNmGaK54Q3hmqL9HXjbbF81QAQFlD7ne2zAQuAnhhD/E39cADBo1AJs3QR
         BFfT8wW9H/dneESzXl8oeveOZCQ19H/AMkWmzr/vBL9t5RcK5cTFebcpNaQP513PunOL
         0DvyrIkWjwSzrR4kfv2XdnutbkJ0xiNP0yMvL7m3bIELVnvNRyF7XRtQyeJNYimbthos
         hRc6OtEvjrrtKiOACtjAV8NOpKpK5Jawhy7DffuRF1TFw9UZi0xd+BZZHcg80jMPhglA
         4HNePjoKBQ2YM/zP1NppyZFcrIsQg+4FVm0cFi/0QfH56U6C7BWVkpAevS8SkHmmcmgg
         BLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tXjIjnxYMI42IRu4LCReG1Fw+YG7xeYmx7NOLjI+qsU=;
        b=VRS9QcKSni3t8CmxgBRUa9q6uzZ1fCCZLKbgJlhuoI/1sDxAjKPcS82P4rlyuzMiwv
         hZxrH3D7mTVxzjJJgZjPLVFGDuLq40ISWgBSox+TDDdF0TLVXmD8wgnOM4Sj3TZjj4TS
         hsSmxsb70GMh+SvI9310Zp6CKEeAxg6Z8KRE08sm2bg46oMEzVIq1S/fnVcGQk6gp99j
         +EzR+hrIDjCL65uXvqm7UR24p3yJYDFoDz/LpYby6XhYsg8cF7LBT7OHPUF0otyU7ydU
         vpLUduKYPNTwIWqFRgCeGgsCl2zIlTYxWN637aBrO/uNbZc8jLIr3PrPO8Mtl2pWkt/V
         TKjw==
X-Gm-Message-State: AFqh2kpfVmN4W6l4hxexh8Q993wHFI4RUxYmZXU1j6tDVixNcd2p2d7t
	W6MhCz+9d96VvJM7eK+RHey2l3w3d1CVX0ijR7Ff0htXwWg=
X-Google-Smtp-Source: AMrXdXty7OzDWRq24LAAOFuRMApEaB5bX7oedcCoBqct2auy6nyw6iQCP2ZDF57/b45HuqhYDOs8IRjydARsKduAJXA=
X-Received: by 2002:a17:90a:b016:b0:228:cb89:67d5 with SMTP id
 x22-20020a17090ab01600b00228cb8967d5mr248130pjq.172.1673361767076; Tue, 10
 Jan 2023 06:42:47 -0800 (PST)
MIME-Version: 1.0
References: <20230106-arm-wm896x-v1-1-441c564a9cd1@kernel.org>
In-Reply-To: <20230106-arm-wm896x-v1-1-441c564a9cd1@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 10 Jan 2023 11:42:35 -0300
Message-ID: <CAOMZO5C9efF4toR9zKs2iaJj2Z-zBpeZYuXVsqHFoQXZidYShg@mail.gmail.com>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable wm896x audio CODECs
To: Mark Brown <broonie@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, soc@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 6, 2023 at 8:14 PM Mark Brown <broonie@kernel.org> wrote:
>
> The wm896x series of audio CODECs is used on a number of Freescale
> reference designs, enable the drivers in multi_v7_defconfig to improve
> testing coverage of those systems and their derivatives.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
