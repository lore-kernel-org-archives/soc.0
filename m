Return-Path: <SRS0=BI6M=ZS=lixom.net=olof@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D375ECAAA1
	for <soc@archiver.kernel.org>; Thu, 15 Sep 2022 16:08:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CDCD3C433D7; Thu, 15 Sep 2022 16:08:56 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BC03AC433D6
	for <soc@kernel.org>; Thu, 15 Sep 2022 16:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BC03AC433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=lixom.net
Received: by mail-pf1-f177.google.com with SMTP id a80so9950214pfa.4
        for <soc@kernel.org>; Thu, 15 Sep 2022 09:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=oSryEY6pZAlX9YRyNSXz1SzfzTIUx7TUAHbTSJ6bgrU=;
        b=TWkFY1xTGyuKO2eSQLVulQ/4429UaJfBK1tZUADR2Q3aa3UQGhkLpUZ7jH1DndB5/U
         S16D5T1M7VeqOWWQhM4k3drCbFK9hn+yZdTk2mNE4z8oIwrIpnogQAFb9/KqVKAa64VM
         g0fQYUkWuZEMGZp2vTpDIfxMtM6droSCiAiPNiUQXbx1Zqf18dQomfyw0ir0rY5m3d5r
         rqXaaMpKhSe8hxxvUQjyrPXsGC3+bIurM68CEOCSpOSgCOul5kA0l62TuIpBXNjQwaQ7
         bje3UPnil0+e+jJ6kwC0MNK30iWPtqId/KlIa98MfRMQpW4R709dzk56WGfu0Z02WXqt
         l/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=oSryEY6pZAlX9YRyNSXz1SzfzTIUx7TUAHbTSJ6bgrU=;
        b=MIXg1TeN56cxNxY4cDL0T/jlCqqXlfLEl8z/by+hcigmfcwnbq7NX/T6FDA9yHcE/1
         LRM04UGV1XslsknNcYZg3p0PabXx5hq4oUbACdTtQrSmjtntOMZA2xb4mdiGjEIa9XyX
         2dTU/ZxFHmOK4JHNDryv189CcbfnDl/2mJ/JiH447hve7Zae3SxGJJZc+pznVoEP6Oef
         1pdwaF22KppdrGPG3q8PIH/U5cI1NnXlUq0D9Y2N71JqltdUPHml5UNArI62F/cuyKx1
         Srk/ggo2Vqb4OXS7MaLFTgWokU7nFRykQEaFtcDxMuwsV29CSXGPRHeJYCCU8yYjF+Oq
         m2qw==
X-Gm-Message-State: ACrzQf2w8M7qEvfnNZ2GWLXaWDYvjxoLGYv0AqcVC1Ek4jLOsmKj9FXx
	5zFxvuh/H0iACnI34OCH5qZ3Ow==
X-Google-Smtp-Source: AMsMyM4q3xImUdLofHIofioy3acasHIAOnV0nNh+ZAHLKYfbXqL0rWo3wu+puIWxh/edtN+uTVYAIw==
X-Received: by 2002:a63:dd51:0:b0:430:18d9:edf8 with SMTP id g17-20020a63dd51000000b0043018d9edf8mr480809pgj.163.1663258135003;
        Thu, 15 Sep 2022 09:08:55 -0700 (PDT)
Received: from localhost (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
        by smtp.gmail.com with ESMTPSA id p1-20020a170902a40100b00174fa8cbf3dsm13045175plq.157.2022.09.15.09.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 09:08:53 -0700 (PDT)
Date: Thu, 15 Sep 2022 09:08:28 -0700
From: Olof Johansson <olof@lixom.net>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	krzysztof.kozlowski@linaro.org, arnd@arndb.de,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	william.zhang@broadcom.com, anand.gore@broadcom.com
Subject: Re: [PATCH v2 2/2] arm64: Kconfig.platforms: Group NXP platforms
 together
Message-ID: <YyNN/IZgOAlbSHnF@lx2k>
References: <20220829173830.3567047-1-f.fainelli@gmail.com>
 <20220829173830.3567047-3-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220829173830.3567047-3-f.fainelli@gmail.com>

On Mon, Aug 29, 2022 at 10:38:29AM -0700, Florian Fainelli wrote:
> Group the three NXP platforms under an ARCH_NXP menuconfig symbol to
> make make selection of similar vendor SoCs visually nicer.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Hi,

While these are convenient if they're done right from the beginning, the result
of adding a new dependency like this is that old defconfigs stop working if you
just go with the default.

Was there a reason to group these now and cause this config churn for
downstream users?


-Olof

