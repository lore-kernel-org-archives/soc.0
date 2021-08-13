Return-Path: <SRS0=C417=NE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79551C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Aug 2021 18:58:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4298560FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Aug 2021 18:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4298560FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5EvWzvttaPKoCdDUSmsHtbHlIxu5IWiRfs8VoN0bNdA=; b=UmwhDCvPKWZl7b
	7wBlZZ8gqyWwtIUrb8KYlu2ADMBVTrccyK6VXhCoPIxNHn9Gc8EEMR2DHJAT61LNOAIqdBFG3ckfQ
	NfKux0GoG1Hr8DUcD4ycplTBriSjtx1/ml0YyI2evasJsxecTQA1asD6DuvK5cV+6gXezt6hi2MOq
	6ZqOk/uUqWGv9whkTae5ArK/fM7s8Je2BLgKgH9N7tOI/frvv3E+JnHC4KL4bSf3zOR9d5AJnutL2
	Oxg1T3qF04Q2LQeeXYf7SmVKefMGSkPwNsDEWkFwN/IeWIYiUL4vfbgl7t7nkKoY7NXQPsDKqslEE
	KrfYvzUm24IQU4CrfTPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEcLs-00DOEO-3a; Fri, 13 Aug 2021 18:56:20 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEcLo-00DODI-Db
 for linux-arm-kernel@lists.infradead.org; Fri, 13 Aug 2021 18:56:17 +0000
Received: by mail-ot1-f49.google.com with SMTP id
 r17-20020a0568302371b0290504f3f418fbso13117039oth.12
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 13 Aug 2021 11:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hzJEw0L+kP4NgMaVTXLDpwO/ZHH+044EBwZ0FnUt4pc=;
 b=eloL1dzOH5fkmOol1pHEfyKV2Hqa7lFenP39wgSb2pNO9ecnkpicQ9fLTcndzoxjWP
 rFpKT5Qd1TWjHjIdchnuO+F57JBCBzc/CXEyOeUXNRiDIVhiV901uKl6ejJLoVAVW3iX
 eR16Sxn8x9YAPQmjnl0ZpXHk8YzZqThGaHRnXmb/yCMOhODo0wkSiUjiaDdLyELnZ+gi
 lYGYCXtuIJYPuyJCoYHE0qZe0XhVf99eprJSZGodj5BanrnrTTb8gOcDjRXJgUJk3I2u
 czrdxMpCTfPrCdorD3EtMY4S1Qq5q2uvl5qCUqUOy+ZukMXotkU8T4OVOzLd7VfF1nYm
 zu7w==
X-Gm-Message-State: AOAM533QYMiBaJ5gGWn9hAZK5I5imH7Wyc6zMKQXWRiGVmWqX0lHgum3
 GKbTwfdFDsQUHvSulbg5Sw==
X-Google-Smtp-Source: ABdhPJxF3tjwBS2dlLyMp36aylpfzvH9ZeHuko+34laK+0gtd9fhwvTyAGtSV/ixwbCc6l+jU0CfSg==
X-Received: by 2002:a9d:7d90:: with SMTP id j16mr3341650otn.186.1628880975818; 
 Fri, 13 Aug 2021 11:56:15 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a19sm485076otl.48.2021.08.13.11.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 11:56:15 -0700 (PDT)
Received: (nullmailer pid 3860867 invoked by uid 1000);
 Fri, 13 Aug 2021 18:56:14 -0000
Date: Fri, 13 Aug 2021 13:56:14 -0500
From: Rob Herring <robh@kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH 5/7] dt-bindings: add vendor prefix for calamp
Message-ID: <YRbAThIgS8qPi9UP@robh.at.kernel.org>
References: <20210805155357.594414-1-claudiu.beznea@microchip.com>
 <20210805155357.594414-6-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210805155357.594414-6-claudiu.beznea@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_115616_512713_016FC122 
X-CRM114-Status: GOOD (  10.54  )
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
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, alexandre.belloni@bootlin.com, arnd@arndb.de,
 linux-kernel@vger.kernel.org, soc@kernel.org, robh+dt@kernel.org,
 ludovic.desroches@microchip.com, olof@lixom.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210813185614.emj8-EH1j07RpVcpZVPQ6kffze5QUY4hQXzsuwldESA@z>

On Thu, 05 Aug 2021 18:53:55 +0300, Claudiu Beznea wrote:
> Add vendor prefix for CalAmp Corp.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
