Return-Path: <SRS0=PkxC=B2=gmail.com=groeck7@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EB2C77B7A
	for <soc@archiver.kernel.org>; Tue,  6 Jun 2023 21:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BFF39C433EF; Tue,  6 Jun 2023 21:34:36 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 61E49C433D2
	for <soc@kernel.org>; Tue,  6 Jun 2023 21:34:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 61E49C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1b065154b79so58120305ad.1
        for <soc@kernel.org>; Tue, 06 Jun 2023 14:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686087275; x=1688679275;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qLv8sUGLb5iZH0uN4+DZWSnCApGPJEQejVn3MnbQ7hk=;
        b=iW/nsyvYh3ccaqabJONHB6BWR0cbwnLkVMvcRqH9rvPKQHG8Mh8dloPFhH5wh7Jehd
         NakpcHmTqyZ7Y2UqySpXSDvUABnJaTc+UuJDk1wP4KCH9hhduD+gDwtdwNRpiVTfVTzD
         ybLA8IVosW3kMbY6TlafTNo5xg9ixiTD/uAADcXUTOewKY8+zRjQiLDcv8oYaxToiv2l
         Kf/w8nPClZQ8zlmvl2u1wI1Bfpwh+bKAv0Jhsg7aBjXNkxsp2tC2we5VtVxqa2DC2fWW
         tq5Ij0l4DZu6IKhM3RJCiGkYPV1hvzsw2jFM5XYmTdFg0fmt73wN5RDaoFBRLL6N7io1
         4ITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686087275; x=1688679275;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLv8sUGLb5iZH0uN4+DZWSnCApGPJEQejVn3MnbQ7hk=;
        b=PHFsqWmGaOVgOQFHoIIiftyp49vJ+sXQK5K7EBtMV06yl7p0YUvqAH/k95MsZ5EVS3
         Tkv+PSl3KDMZlgknBbGfNH2aXAZ/7mefE0y7+eZVMSnKNoawBUC7ePVt0RMnAFWmksZM
         QE8fqCtWXw3AM8tPxhuFIdSNby8mYeGAukHW+zZyVD9KB5Wqqqp9GyCg2VMB/ltEbyfC
         RrXHqqZ/ZUBiLq1F8iq1rKUv4uzmJPeJwJGFRy9vlCcQw7MtHR21s52wAPw4Hf3Gshcc
         Y6OqeisKI+vehHi1iyRM5iygiJWYRkUysfbDPLR50Xs55ekkXyCp/sSRD4Gh4Joa2631
         zGCw==
X-Gm-Message-State: AC+VfDzs+nsTdFiHfXTWSOzscX/F6JxUL3ElSgFJtH4U0aG7ABZ7beJk
	iSz2XYEjL5Sa0J8i6uuRQ1gpGDCBOo4=
X-Google-Smtp-Source: ACHHUZ6I0zL8Pmz3w7AW/cYbyzC05TWpo5nv4nliLSyFLiNrGdYzwcxTY/ycjj/C78tlbO4OqC6tDg==
X-Received: by 2002:a17:902:da8f:b0:1ae:35b8:d5ae with SMTP id j15-20020a170902da8f00b001ae35b8d5aemr4458987plx.19.1686087274559;
        Tue, 06 Jun 2023 14:34:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u17-20020a17090341d100b001ae268978cfsm8961177ple.259.2023.06.06.14.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 14:34:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 6 Jun 2023 14:34:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>, soc@kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-omap@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: ads7846 - Fix usage of match data
Message-ID: <573dba2b-b4c2-4055-ac21-7ab1d141e5ea@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 06, 2023 at 09:13:04PM +0200, Linus Walleij wrote:
> device_get_match_data() returns the match data directly, fix
> this up and fix the probe crash.
> 
> Fixes: 767d83361aaa ("Input: ads7846 - Convert to use software nodes")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Tested-by: Guenter Roeck <linux@roeck-us.net>
