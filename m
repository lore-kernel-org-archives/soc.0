Return-Path: <SRS0=hiSs=NN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C206C4320A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Aug 2021 19:09:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 106DA61250
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Aug 2021 19:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 106DA61250
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qyyw3skHuBTraLI/RPkfycFmFo71z0IaxMNUK45Y0X0=; b=D2zCMRYyHwVy6r
	peKdhKCddospAxZudjCzbRiAlV35ZU5qQgNav9J3HeZMk/KCHcbJVa5l54VLw7vO9I7hIMOguNIjW
	gfVL26Zun22IW0VRXNrl5pnS+mzCtWBOW4ilcv8k6O9D4I0lsDacFVhpYkdN3nIOThKpfLzVar7BS
	P6Y1ent5lwxgOH9J1vdTuv2oPDZogJmDsODaWeXJ1JZPRP9iz4MecHzLI03PMMxeMenKFIPJ6BpWS
	75XvLaHhTl2GDRzZkC2GhyPR9xB/Rfcu2HOz6sQVuZwJSzMopw6fVW15O3JAQObag9Le6U+Joqtdd
	WZ4sqE0IMPep8frOf3bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHsov-00EYtH-Ki; Sun, 22 Aug 2021 19:07:49 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHsor-00EYsP-E9
 for linux-arm-kernel@lists.infradead.org; Sun, 22 Aug 2021 19:07:46 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 mw10-20020a17090b4d0a00b0017b59213831so5366849pjb.0
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 22 Aug 2021 12:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=feHXKMgHM6nYe6wa8RO2hvQpcDXnS++8l8lp6sQROGc=;
 b=Xl98lYIggRtOCv1ckeczoKeUIxykxz/JHPJoBZagg1FuCw0CwY4t+xMfhLDijyK9/r
 V1q6xQ8vKMMLT+msfufsXQlLRuJrH3zP4evso6GfY4iM5iOl//A0uYD0iB1qvXvxiMUR
 t4rhgYLqymNG+xmk35xwynK1IJ0Tb56+Cx7sWuRT6ZejjlRYMutK7m5EIOdTzhiq3jBJ
 lIJhIb1gol5OOYlvybhGhwXQIP0ScYi3r0sXpSTb+wucLTjJzNcH4PvR/ueuDwwF0N28
 wbNdMxwRQLVqDVyi7WdZ0G/TSNzbbzdNqBCDNpPKyO4sphWn+s0DssG46QRZA9BMMCw0
 MYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=feHXKMgHM6nYe6wa8RO2hvQpcDXnS++8l8lp6sQROGc=;
 b=MdqZZTH7wuDEp9Qf0fIbHn1ZJx7FK8Wp1oDtujSUNVKYLHkdP78OlFGXyxMtyZHBs2
 GM0GWCBdK8XqWq7ojrgNyII+HQukgu6Bl1CP0s1qObls0IkFI6Y50gH2Q5oHuG7GuD2y
 N9lDI2HocPdJgc0v5fnKNu4AL9HN1MVCmZwNP7ztWOftyU7JwCLjdvt4VDLsJFQcPQ04
 vn2sbxQr6KJcmJHxCvhNEh8VVNo2xJMdDM7MpgvkwvDpCy3Qbic8PhvC13OoSTMqjJX3
 VKRpj+kHLFsul0DYGxG/v4A8INOOd3W6WweXIuHafGJiAMQs7u5A+3dRTaqMZsqRv7O4
 dHIQ==
X-Gm-Message-State: AOAM5318kqG4jchtFXsRO+EnWV4p2FHaGZr3rjcgowuRZOKAy4P9lQTe
 kFojshL2JB3crpLcXpW30mk=
X-Google-Smtp-Source: ABdhPJz65Y2dES7lBGoxVxSz5Wx2FGiSa75pqG5UphJ1tSbo7IL/TeuCNVFCXhvGXYv7lt348umixg==
X-Received: by 2002:a17:902:b102:b0:134:a329:c2f8 with SMTP id
 q2-20020a170902b10200b00134a329c2f8mr727569plr.71.1629659264718; 
 Sun, 22 Aug 2021 12:07:44 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id x42sm13212111pfh.205.2021.08.22.12.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 12:07:44 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: bcm-kernel-feedback-list@broadcom.com, Matthew Hagan <mnhagan88@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Sam Ravnborg <sam@ravnborg.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/5] ARM: dts: NSP: Add DT files for Meraki MX64 series
Date: Sun, 22 Aug 2021 12:07:34 -0700
Message-ID: <20210822190734.3714140-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806204446.2981299-4-mnhagan88@gmail.com>
References: <20210806204446.2981299-1-mnhagan88@gmail.com>
 <20210806204446.2981299-4-mnhagan88@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_120745_549748_42212C00 
X-CRM114-Status: GOOD (  13.80  )
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
Message-ID: <20210822190734.kgi8NN-ELSJMnWNu-tp3iPc6fBGikL-RonkvdqMPxaE@z>

On Fri,  6 Aug 2021 21:44:34 +0100, Matthew Hagan <mnhagan88@gmail.com> wrote:
> MX64 & MX64W Hardware info:
>   - CPU: Broadcom BCM58625 Cortex A9 @ 1200Mhz
>   - RAM: 2 GB (4 x 4Gb SK Hynix H5TC4G83CFR)
>   - Storage: 1 GB (Micron MT29F8G08ABACA)
>   - Networking: BCM58625 internal switch (5x 1GbE ports)
>   - USB: 1x USB2.0
>   - Serial: Internal header
>   - WLAN(MX64W only): 2x Broadcom BCM43520KMLG on the PCI bus
> 
> This patch adds the Meraki MX64 series-specific bindings. Since some
> devices make use of the older A0 SoC, changes need to be made to
> accommodate this case, including removal of coherency options and
> modification to the secondary-boot-reg.
> 
> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/master, thanks!
--
Florian

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
