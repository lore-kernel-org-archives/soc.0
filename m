Return-Path: <SRS0=WP4c=VV=gmail.com=festevam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6D7C433EF
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 16:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 638F8C34115; Fri, 13 May 2022 16:20:26 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B799CC34100;
	Fri, 13 May 2022 16:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B799CC34100
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id r11so16144553ybg.6;
        Fri, 13 May 2022 09:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PP20JmaiXC+VUIvlF0hhnTmGYbLQxZr+LGVCptCogxo=;
        b=qj3lDMzg1XMQu0Mm96d7OjtllaTzqJ5puC4PaDYG3PT+MUSUSloHfUukJecIf2BWhV
         F5shPRSx7i7WIhXsPVDxvrwOgK6FQAzkrHrf5Kpvb7e0+OWScIpdRRX2Tn+ZTdKmmbI/
         ay7tF4GyByOqbFiBHC+/SzMraJUa/AE6eyqymUXENzYUkC6H8vdh88K4tM54u5lFh8Gg
         WZ55Wukw0b8HyAdNjxQIW9xcgUBDOatY7VhWDDTa5UOpBMCvGmnDn1WouMjkdoUT7nZQ
         +Hqz6dMHuTGxpmDTCuC878d8LtMk5YqH9YCJGnrLUgu10GiCz1Towt37zJBhKNH0X6Q9
         ttQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PP20JmaiXC+VUIvlF0hhnTmGYbLQxZr+LGVCptCogxo=;
        b=PW6DlTeeMXglqYUTOXxzySzE2cha/adx2gbo0Hk9vyHaCbqNADel/xWTV27oC1Jbdu
         odV+LVqDKkvEuyO0QWrPMyAL7WwXGYK2aYsaSuXkKSNLujVvkbjYzv0nsNkvDrnm2L/f
         ++aAt7t/hKbJ+H/oA68a9TeL9+Oc+4ZnxVS+85neVA6ZJrsltnAj6v48kk/Uk+BsR7EJ
         WkTfnNF7hzuCHF32UDH8DHRaz3nidVjipaQlDjWQ03bcB48WJwgFnimgOgfRhPblT8TD
         NtsYWPJrtmW0KAL7oiBQE8fHxqCMp1QuadQ0uEPcyEuedxY3lIoGvyM/jy3eINKq15VA
         aCbQ==
X-Gm-Message-State: AOAM530EB0qLn/ebS1uTJF4LrQEzUCPK0sRXAbR6kZR/8bFunchbQCEi
	RDK5MJKSYNORwgHjz4Yuu1NVO1A6JS9a8scv6ALkagejlkjYDg==
X-Google-Smtp-Source: ABdhPJwkOKIen4lD873fop9sInA/4YulUhfoIH8ctkjiNQQOAjej9yGxZ3PjlLFNwrUEUOM63xI0zyK/s0XEZVgHpLg=
X-Received: by 2002:a25:e7c5:0:b0:64a:718d:2f78 with SMTP id
 e188-20020a25e7c5000000b0064a718d2f78mr5424259ybh.564.1652458824599; Fri, 13
 May 2022 09:20:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220513121258.168364-1-broonie@kernel.org>
In-Reply-To: <20220513121258.168364-1-broonie@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 13 May 2022 13:20:13 -0300
Message-ID: <CAOMZO5CTzvVB70nE8mbBj9w=0t8BmZ==hQ3UibsLrrMb4Os6nw@mail.gmail.com>
Subject: Re: [PATCH] ARM: configs: Enable more audio support for i.MX
To: Mark Brown <broonie@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sascha Hauer <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, soc@kernel.org, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 13, 2022 at 9:13 AM <broonie@kernel.org> wrote:
>
> From: Mark Brown <broonie@kernel.org>
>
> The generic audio card for Freescale platforms is used by a wide range
> of i.MX systems and also has selects for the various audio controllers
> used on them so will help with systems that don't use that specific card
> too.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm/configs/multi_v7_defconfig | 2 ++

imx_v6_v7_defconfig has a more complete audio support, but it is good
to enable it in the generic multi_v7_defconfig as well:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
