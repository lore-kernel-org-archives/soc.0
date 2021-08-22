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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64FD5C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Aug 2021 19:10:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2624D6126A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Aug 2021 19:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2624D6126A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=saFEf/GsesyvPlLZc8r+fWf9FJU7RTAbYKt3aa+NLwk=; b=pkPnXBDRUaDpec
	xnZfmWjMnCAgQDC1msxgAZT0qQN9/9qZteGFEa2ShQqBsb1KKfmpZEcLCleey1tPNn3qHPuCu2xhk
	VklNh3/f4HUl24nfmf9N767xwP3+q/0pxqlafv/xQbrK+NagXDeaLwoXlkxDmfVMQynHqoJFadDCg
	nw/Po86NWYujZWf1p3C9Ja3olerlzpv3V0pD/ayPfWbSwm+whD2qYgRjIpt/MPg7zrqAmT3z7xeBz
	NkVOo3tV1cFTi2nnIX/S0fmGjGRRno5HLbYWALbCUviKAs3w8tdjxhy44BHfR6TJO2VpumbCpbZKa
	1MSwrXiy3/xvim9Zeo4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHspL-00EZ0T-9L; Sun, 22 Aug 2021 19:08:15 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHspH-00EYzO-AX
 for linux-arm-kernel@lists.infradead.org; Sun, 22 Aug 2021 19:08:12 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 j10-20020a17090a94ca00b00181f17b7ef7so4363982pjw.2
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 22 Aug 2021 12:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
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
 b=QdwG8PURC0fiqByACBHXB3F/GBgmUWKohu123BvB0GTaG9moO3RoKsr/IXgeOsCKWg
 MExiColJS+Q5vahaCmUL89SE4rE1Tw7EVqnQ0m+tVwq6QJNt4sbPETo75dirtq6Q7o3Z
 K2afsAHeGxusJEzsb8O7xpu9tUnequDvweW6vaD6bPi4JBRJaoO+LOe3QlFdUkvKNS6s
 mgi+9lbxrVeJt9Hg2JbsnGX+WCU3Y+eYs7aETeOO2qpEatUyUQZFZr6AVxNEYboX2SeB
 b+cE1el7Zp6/HjrYCW1EvcngXupyg/ZrZXg0rGVpeqxhjdx/NJdp5MqeCmzAgb5IwEoX
 MS7g==
X-Gm-Message-State: AOAM530iZNjNQ0njlVmqxV/1nHWhQnQFZZDE/d7ggy8KSL1ET33+a15+
 g86a6xFpFSvn6ZZp1yFgT+Y=
X-Google-Smtp-Source: ABdhPJz2ly/E/3S88Cibhj563lMhxvOm+rm5n7I5tasXODSTriKwd0INM95F99cABI1N8qaKK3ip4g==
X-Received: by 2002:a17:902:aa43:b029:12d:242f:32eb with SMTP id
 c3-20020a170902aa43b029012d242f32ebmr25403566plr.66.1629659290606; 
 Sun, 22 Aug 2021 12:08:10 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id s1sm11700030pjz.36.2021.08.22.12.08.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 12:08:10 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: bcm-kernel-feedback-list@broadcom.com, Matthew Hagan <mnhagan88@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sam Ravnborg <sam@ravnborg.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 4/5] ARM: dts: NSP: Add DT files for Meraki MX65 series
Date: Sun, 22 Aug 2021 12:08:00 -0700
Message-ID: <20210822190800.3714263-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806204446.2981299-5-mnhagan88@gmail.com>
References: <20210806204446.2981299-1-mnhagan88@gmail.com>
 <20210806204446.2981299-5-mnhagan88@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_120811_403356_3B812A9E 
X-CRM114-Status: GOOD (  12.72  )
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
Message-ID: <20210822190800.mYzyBiMhvkxqZYOm1rzCJlCE-j7ifxub6k1P_ovt2yU@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
