Return-Path: <SRS0=hiSs=NN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70696C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Aug 2021 19:13:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DA8161284
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Aug 2021 19:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DA8161284
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VLOzXftCVBIlT1eTaou3FmSJvoBAXUFeqoXJbZfBRiQ=; b=iCJYgRrGwZQl8E
	dy1cUqHSdUr3YEnWLBszYpZcTpchaZtGvNlopLXn7go0khH6kGLZd3j2FYFK5c5EgA2U7DYT+x7s/
	MU+dZdppVS1B8cRUFMHMHzCSXMsadwxDGeTvDHoQ2MlctRwcZF+ozfZDjRd1X7SpBbkSN8Se/iY0e
	sJyJZazUqmUZcZ+lWmz8SA4nxD85ivwla0IsZr+bGCcPvQUAkfl5q0BQV81oGDu5exK9XmfQTBjAx
	96pcJffvTlXWjswroVxagi2882nII9a4h3mK7BkVAmVwmTjU93VpWkCdhBD2t2Up1rbq589vD9TJn
	ntn5Xdfnv20HE/ba99cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHssH-00Ea2m-Oh; Sun, 22 Aug 2021 19:11:17 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHssD-00Ea1U-VD
 for linux-arm-kernel@lists.infradead.org; Sun, 22 Aug 2021 19:11:15 +0000
Received: by mail-pg1-x533.google.com with SMTP id t1so14560000pgv.3
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 22 Aug 2021 12:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5WOhtJyCLvDyk28Uv6Zj5si2SYr4yFsA2nofOG2/o1k=;
 b=Wz0kZ27KKW6Mkr0Ljumz+UEeVmlScKBd3SqmrVBy6KUfr0wF7nyeSOKn17vo71LplZ
 oZ2FRQhL3WZekO7gvtgQDi99tK5ZmTJFqu8qfP7zzNuQVSAkx0+fxEkR//gcJ5Dh/X1r
 B6LyfFsNTSZv3XnjF0RInJ0sFom9tDOsnjcaZwD1/sKl7H70ggBXS1n/0xU9jRaJcL/j
 TzoxI0ObF11ea83IhP7yeEfwZAfd5SDKZ9WqS2w53TTFaqZqUJy2I/1aABEg7lw79ejV
 y3nfCNPkOcgLdIoeT6EmOETyueHNf5R7e29BP7/Xkw4L6HzEv4dmvvkMDtpbnv98FR4W
 VJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5WOhtJyCLvDyk28Uv6Zj5si2SYr4yFsA2nofOG2/o1k=;
 b=RWpz3tbFauczG/JHQBz3p3dS7Q8KVVojZSEQhgRXN8xCipNp5+Tk93VaDlBMob7t5n
 CZES9cJdiCzGPnfpD/GlHnNx6c/IcHopVjay5ve76umkMM8UzeKxqE9GFi3TqRPKeR4S
 yBe0FO/ZTJwboTjiYyVhWw0t6iI6Gcnwc7h6PvtvF5SPw/uJULezs02TBZMO3aWDLxmh
 P5wzCdDqlFS7Sa09T/B3+lztLjEzXH1diCTQRCWPJxZXagftS9YDhKItFODv1SgM8Sfg
 0CV2VFBpk7WtgfhrFOXfHeVoATvm7lCBxPsMxifgKJWo+0KflEIE/pf6pB1TOSEXCqc3
 /Qrw==
X-Gm-Message-State: AOAM532MNfziZDifQ6qScNEyV6WFIiq5jFUTwXMlXaAnvy4DldVdjf/Y
 3vSnOV98LnUhjdUGkeX4H2o=
X-Google-Smtp-Source: ABdhPJxYC7o83eBX/pP5vI/s2sm27ag7i588rxJM1xgfgu0UDLC/aq3mqIR7U+jtN3rxmI4KNTSelA==
X-Received: by 2002:a63:dc03:: with SMTP id s3mr28947680pgg.88.1629659470822; 
 Sun, 22 Aug 2021 12:11:10 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id u9sm15542103pgp.83.2021.08.22.12.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 12:11:10 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: bcm-kernel-feedback-list@broadcom.com, Matthew Hagan <mnhagan88@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 5/5] dt-bindings: arm: bcm: NSP: add Meraki MX64/MX65
Date: Sun, 22 Aug 2021 12:11:00 -0700
Message-ID: <20210822191100.3714613-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806204446.2981299-6-mnhagan88@gmail.com>
References: <20210806204446.2981299-1-mnhagan88@gmail.com>
 <20210806204446.2981299-6-mnhagan88@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_121114_047876_7BFA7095 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210822191100.2DfPkuhSlxXEKn5LIA2RBAoY4Xuvqy8f7-r6t3zGnBI@z>

On Fri,  6 Aug 2021 21:44:36 +0100, Matthew Hagan <mnhagan88@gmail.com> wrote:
> Add bindings for the Meraki MX64/MX65 series.
> 
> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
