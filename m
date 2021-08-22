Return-Path: <SRS0=40XK=NN=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44CCFC4338F
	for <soc@archiver.kernel.org>; Sun, 22 Aug 2021 19:08:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 20D6461284; Sun, 22 Aug 2021 19:08:11 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAD176126A;
	Sun, 22 Aug 2021 19:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EAD176126A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so17244507pjr.1;
        Sun, 22 Aug 2021 12:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OLJNoKkWV+HRX+RHUKmR2ouc9DN10iA4tGdE8s1TbQ0=;
        b=EI4o8aTNO2xT7FKtU/faGMG6cljPKBROny0nDZpSWMmEEreCQLecRxjENOZscY+TwW
         LKsi8sO3D2UcLCZnJOc8LYzMzcpnDr561RAiADig8CqGBdmYDTNXb3dSyo5ovn3dt+aQ
         kIF1Q0NISks/sCl+gxHXUcIEm9660L5iyAWsIyT++Uo5wquVh7nwoa45+n/FTmC9Pdb2
         RTMaAEtAc5jH3joPaINfaRXiPqWB2/3sB8IeUMLX3r/WmHDsNisuhewg6TPNFaP+vjsf
         ozSLxKmKOn2bwvVJ/RDvdViadT1P60xnsYG0X/q3cZnKkla+lsVproJ7195tZgaYzj3y
         mULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OLJNoKkWV+HRX+RHUKmR2ouc9DN10iA4tGdE8s1TbQ0=;
        b=VwJaj57oCkWAsBCu/NXf60Nqam1IWobEkonB7YTIcmsGyG8/wYBw9qzxRD9aw5hNID
         +qNFYWcXrFC5DleEw2ZUceXQa+Eg0qqp4CsoA6wEPa7T4+k8D1TP8vj7M3C9UOmR7Lz8
         kee/VsQC4szDcKejioK86vdilzAr6lGTbi+0rVXwzs5Ghqz0l1R1CCWfza/zfvaL8gDY
         sknO8OXLyQGPWXmBPAKBQw3jRyDxNNvk94pyGeuAceVvTkiI0zVXQkqEUuW998z0C8Gj
         5ixMVKK+qNPjVpyEAoTFfWjwSlhTgirgceA1lyahYj5ZbXGx0eUjafWuXt8ROhSHbTgk
         klEQ==
X-Gm-Message-State: AOAM530f6DhMfZ0aLc4pWTYY2LXcHeiDOZTWKLpjncn35+zsFxcGhGlj
	8DPQRQvzrFe1KCFJHmUtBFE=
X-Google-Smtp-Source: ABdhPJz2ly/E/3S88Cibhj563lMhxvOm+rm5n7I5tasXODSTriKwd0INM95F99cABI1N8qaKK3ip4g==
X-Received: by 2002:a17:902:aa43:b029:12d:242f:32eb with SMTP id c3-20020a170902aa43b029012d242f32ebmr25403566plr.66.1629659290606;
        Sun, 22 Aug 2021 12:08:10 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id s1sm11700030pjz.36.2021.08.22.12.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 12:08:10 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Matthew Hagan <mnhagan88@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sam Ravnborg <sam@ravnborg.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 4/5] ARM: dts: NSP: Add DT files for Meraki MX65 series
Date: Sun, 22 Aug 2021 12:08:00 -0700
Message-Id: <20210822190800.3714263-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806204446.2981299-5-mnhagan88@gmail.com>
References: <20210806204446.2981299-1-mnhagan88@gmail.com> <20210806204446.2981299-5-mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri,  6 Aug 2021 21:44:35 +0100, Matthew Hagan <mnhagan88@gmail.com> wrote:
> MX65 & MX65W Hardware info:
>   - CPU: Broadcom BCM58625 Cortex A9 @ 1200Mhz
>   - RAM: 2 GB (4 x 4Gb SK Hynix H5TC4G83CFR)
>   - Storage: 1 GB (Micron MT29F8G08ABACA)
>   - Networking: BCM58625 switch (2x 1GbE ports)
>     2x Qualcomm QCA8337 switches (10x 1GbE ports total)
>   - PSE: Broadcom BCM59111KMLG connected to LAN ports 11 & 12
>   - USB: 1x USB2.0
>   - Serial: Internal header
>   - WLAN(MX65W Only): 2x Broadcom BCM43520KMLG on the PCI bus.
> 
> Note that a driver and firmware image for the BCM59111 PSE has been
> released under GPL, but this is not present in the kernel.
> 
> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/master, thanks!
--
Florian
