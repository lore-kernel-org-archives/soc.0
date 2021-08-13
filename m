Return-Path: <SRS0=C417=NE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFAD7C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Aug 2021 19:00:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF96260FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Aug 2021 19:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF96260FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eAbQAQob+Cex99fEW9HxH/NQDOzN+TuqFMakf/CLxPM=; b=YSnyWZZUdCo84n
	VQ0PkednA3OBoHlVOqJZhYnREfRoqEyC57ZgH6KobVOEZQU9hyJCFRWOZqtfKLxPh+3LxxpJn+nSw
	vPx49/M+7QoGiiF1kfpe3zJuguWqlVVexydEiisWKGWzbdG4kvcfpEhJoIDhGkHKJvtf+ZsWCvY21
	t0NEXovfyecP3Ig+du2EiADMzHtGlW03qHPbbxWweF90iYHqY7iRiQlqRgjYab/dOnikMhtymAsjI
	1317pZsOMjYVwtfIbSBSzLDXkI4ZuRtSzHPAsy9Bq5sWp5ewiy2nBOMVyd2DOt240w/oPVaOE7jyC
	MWxT2HSXkHhvWI1cm/Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEcNj-00DOzb-M4; Fri, 13 Aug 2021 18:58:15 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEcNc-00DOwt-9j
 for linux-arm-kernel@lists.infradead.org; Fri, 13 Aug 2021 18:58:10 +0000
Received: by mail-ot1-f43.google.com with SMTP id
 n1-20020a9d1e810000b0290514da4485e4so10397300otn.4
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 13 Aug 2021 11:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2ahbi0HxPkdDvGYRdzmdU3KAyAbBbSPVHz7hpfMgNRg=;
 b=drWnjfbrSFOyU0AsXFtf/UZpRG1gNaOdnVDswabdNQGiaaVYIt6G6IiOxBANr7ZiUN
 /sOHs7GRJEZSL0YW3oeroUq9obMOhVNIMGSu959Ox/rAwgzMN8YsEQuuxdMXiBuVrTVk
 CxXc/YJ1gmH202FtvJHK0DWUl1RfY4PjNey1rRAq9fV4YgADTDgst7UzJ/L9/LibZ0M0
 9I6Qqgs2p5csV7DTsPOt8kteXjthVham6elxM5F1zyDb0/LIz3NuXae83NWLakc9Hm/A
 hMUK7HMDxAZwhuUDusReYyWwp11qd8RrlOy4wLcz+pvZOoFmuE3fMGU+fT68T5l8QvV1
 mkRA==
X-Gm-Message-State: AOAM5312sepP7CmS4HcZQC9y9N8DBWePCEGIjfDZ26swNb/iJdwTb/p2
 jc+kau9jTA5d36PPhanfSA==
X-Google-Smtp-Source: ABdhPJzHZj/ieyh/1MFb88kr2BlhZDymgMcPqE6HFAZ0U5SqKihtA60K+j/60g02HxtLR08j4ubh8A==
X-Received: by 2002:a05:6830:411c:: with SMTP id
 w28mr3166930ott.298.1628881087252; 
 Fri, 13 Aug 2021 11:58:07 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j6sm431196ooj.11.2021.08.13.11.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 11:58:06 -0700 (PDT)
Received: (nullmailer pid 3864269 invoked by uid 1000);
 Fri, 13 Aug 2021 18:58:05 -0000
Date: Fri, 13 Aug 2021 13:58:05 -0500
From: Rob Herring <robh@kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH 3/7] dt-bindings: ARM: at91: document exegin q5xr5 board
Message-ID: <YRbAvRPdU3qdwkPi@robh.at.kernel.org>
References: <20210805155357.594414-1-claudiu.beznea@microchip.com>
 <20210805155357.594414-4-claudiu.beznea@microchip.com>
 <YRbAOYoRoMCtxuGL@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YRbAOYoRoMCtxuGL@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_115808_362618_7B9A7FCD 
X-CRM114-Status: GOOD (  11.71  )
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
 soc@kernel.org, linux-kernel@vger.kernel.org, ludovic.desroches@microchip.com,
 olof@lixom.net, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210813185805.W2pVaUjTU88UzS41yNBkGP7tAX1-ewW2514ncAmdwEk@z>

On Fri, Aug 13, 2021 at 01:55:53PM -0500, Rob Herring wrote:
> On Thu, 05 Aug 2021 18:53:53 +0300, Claudiu Beznea wrote:
> > Document Exegin Q5xR5 board.
> > 
> > Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> > ---
> >  Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> 
> Acked-by: Rob Herring <robh@kernel.org>

I take that back...

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
