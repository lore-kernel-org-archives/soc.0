Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7947C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 16:37:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE38022210
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 16:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE38022210
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iyT40OVl6BSmCi76DQQh3yyYkhvYMdl0AuKMbpanVrM=; b=FezNn2bf7Gz4iE6HYWsrOIltz
	o5gyGOWPxAOrnaU0QC8xZKikfAeKggQoTPLHtN57PHbKrmWjak/7HGLJ5Tb/yvnUZ0sah6V80TzMs
	+oZFrGvk81L958nZuGFT6M1PeKTWq0atVmMKmPG9i6a5sgbMNrIaGQhl3vTWbR2fULvVh7iDVV1oN
	uIIa4N2VjS/6RWZ14ZT5AzHCKOXK0juSxxZx8gpRWWRCWc5HVN998VoHy3CBRnde6VRTatwG8F/R/
	HDGfb34klMx2WS4ZfNy9tpTPsTqi2warRiZ7FtvchAiT7Hmwh+9JQNpen9w4EcW0i6gHiAclwQh5z
	lRFB5A8Mg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn2SE-0007zr-0S; Wed, 09 Dec 2020 16:36:38 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn2SA-0007yb-EZ
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 16:36:35 +0000
Received: by mail-ot1-f67.google.com with SMTP id f16so1932507otl.11
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 09 Dec 2020 08:36:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6Nrvk3PUoM6SzdFghQZEGJk8ahD1T69zwk8JW2tlVaQ=;
 b=fHyJfk7We0fkLnqbCd4QBcsNoL7brEVBHi8UTdsPL5skAC0yY0gPn2a2UCD3asWVuB
 w8jMHSV/mACqyLwBTi9816dzQGoPm6zd7TvyUq0CrJu2UCQ+0dtY1weyTJsUEBJg3SmA
 h1MCukkub+Hp3xDbq1dPWGW30AycH/9StltJpl54V2pjM49LfD0lzPBfngvQr2Zv/XUL
 FTW+1Jox+QyQCS0OV7Tlqrmm7eVZaTnfMi7RRlsHUg4s0bpBSH0fZDdk6ICwAfVcfbcs
 m669tGe6Jct69JZdYizu27HdoO5bE2hht0JTswXosFyk4InuJ/fCD6ibeqJAVVxdWryr
 74BQ==
X-Gm-Message-State: AOAM530DEwKECRCW4f3sbmFbA6wnGB1R329VnS/BjbAyRMIlUS3s2vIL
 FkA6IjKHjDtk3XAKmGdMNA==
X-Google-Smtp-Source: ABdhPJyESP95Acad+YcdIIO2pMEpSKBJsfzgBnAA2l+p3gk8d9NrU8YIa9Fq2cFt2jMoPuJAz8jHKQ==
X-Received: by 2002:a9d:3b36:: with SMTP id z51mr2500260otb.272.1607531793795; 
 Wed, 09 Dec 2020 08:36:33 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b25sm447323ooe.18.2020.12.09.08.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 08:36:31 -0800 (PST)
Received: (nullmailer pid 570767 invoked by uid 1000);
 Wed, 09 Dec 2020 16:36:30 -0000
Date: Wed, 9 Dec 2020 10:36:30 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Palmer <daniel@0x0f.com>
Subject: Re: [PATCH v2 03/10] dt-bindings: mstar: Add Honestar SSD201_HT_V2
 to mstar boards
Message-ID: <20201209163630.GA570737@robh.at.kernel.org>
References: <20201201134330.3037007-1-daniel@0x0f.com>
 <20201201134330.3037007-4-daniel@0x0f.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201201134330.3037007-4-daniel@0x0f.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_113634_504218_A9640C23 
X-CRM114-Status: GOOD (  12.87  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
 soc@kernel.org, olof@lixom.net, w@1wt.eu, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209163630.hJpl6RafpssEMppd4Jj4NatTt3hRXq6d7Z2dHrnexTg@z>

On Tue, 01 Dec 2020 22:43:23 +0900, Daniel Palmer wrote:
> The Honestar SSD201_HT_V2 is a full size devkit for the SigmaStar
> SSD201 or SSD202D (they are pin compatible).
> 
> Currently only the SSD202D version is supported as that's the one
> I have.
> 
> Link: https://linux-chenxing.org/infinity2/ssd201_ht_v2/
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  Documentation/devicetree/bindings/arm/mstar/mstar.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
