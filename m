Return-Path: <SRS0=AuJ1=VA=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7B2C433EF
	for <soc@archiver.kernel.org>; Fri, 22 Apr 2022 21:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8785EC385AA; Fri, 22 Apr 2022 21:18:43 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DA40FC385A4;
	Fri, 22 Apr 2022 21:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DA40FC385A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d15so13488560pll.10;
        Fri, 22 Apr 2022 14:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8Z+uefvnFWrT0pZ39OKSdS02ASLZ9DpBHMH3b5C53dU=;
        b=BYSiNBZ0B0anZ78AQwcxV5rZDxx48ybN35h5nqlSNTX6g/t/mlCWXICBWb3DM26agR
         FqgIr9PnjNe5l5qHYzKCDAYmkG5WLSdI+rKUMtqFdvGgf9FQkp8LmpNqJ8eh158/+UH1
         8Yeh2+SCSulFsMm5iLf5sVztgt/2Kew53i+26ZDN6LCS5JDmsNZr4WbXyufl1+MwtG4U
         tZQE/Txr7/0DRlNy7levUOnsY95pdrCefQSOor4NdNIjP3W9BSt0PajvY9/QmnfgTGOQ
         KQxqb0NxH97AzlsaqPGe+NN8oYXWx3fpnwATSJ0HAVfPlagL8D6LHPY8Cg/Ql1NsutRU
         RVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8Z+uefvnFWrT0pZ39OKSdS02ASLZ9DpBHMH3b5C53dU=;
        b=RhJVX7mdhm6zHjuCoSJ0dRsbLr/P+00A2sUqkRPJM45pjgix254fRhLfjeam4o3wCX
         Yq+QhKHS9aYCg8qbyVW/DsrjBTNbuAzc3mPl3GgopxBnTaqaf3OI+J/zoetgSz67FfnF
         Wb56aDBtyGnPF0b7f8+fws46NhlZ0ItXamuRvtFVjwUQJkZfYqwXA0ACG1NzVabuS5wo
         tcH5zA0SsgQ/uTE0DyvIhOx+/ga19dGiqiOZGRdis43r9LFMsti+/my4Qjb/EfqICrgx
         iQ7pEnFaw0KfQ/YsmeGiCQKoKSI7tEYes8dCElOShbnNz1enfRugK1ytXOBlkiaPQwQn
         L5zQ==
X-Gm-Message-State: AOAM532hteMVlHleZQ5vrerw2qO3LGjsxZPLyXr1mdjcEZn3Qxiy/zMp
	8c/RWJB5w9osF/R2gIptplyqTQhwLGk=
X-Google-Smtp-Source: ABdhPJx7GMxfQ6CDtKtsV5W8yHeMmUDvquJVtCKxvVxlFbf+WnAkrApdnTrXBABxdMg6t37lm8hcRw==
X-Received: by 2002:a17:902:9b92:b0:158:57d8:3a20 with SMTP id y18-20020a1709029b9200b0015857d83a20mr6484373plp.34.1650662322330;
        Fri, 22 Apr 2022 14:18:42 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id f19-20020a056a00229300b004fb157f136asm3608508pfe.153.2022.04.22.14.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 14:18:41 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: bcm-kernel-feedback-list@broadcom.com,
	William Zhang <william.zhang@broadcom.com>,
	linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: Kursad Oney <kursad.oney@broadcom.com>,
	Joel Peshkin <joel.peshkin@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Dan Beygelman <dan.beygelman@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	soc@kernel.org
Subject: Re: [PATCH v2 3/5] ARM: dts: add dts files for bcmbca soc 47622
Date: Fri, 22 Apr 2022 14:18:39 -0700
Message-Id: <20220422211839.2029771-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220413192645.7067-4-william.zhang@broadcom.com>
References: <20220413192645.7067-1-william.zhang@broadcom.com> <20220413192645.7067-4-william.zhang@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 13 Apr 2022 12:26:43 -0700, William Zhang <william.zhang@broadcom.com> wrote:
> Add dts for ARMv7 based broadband SoC BCM47622. bcm47622.dtsi is the
> SoC description dts header and bcm947622.dts is a simple dts file for
> Broadcom BCM947622 Reference board that only enable the UART port.
> 
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
