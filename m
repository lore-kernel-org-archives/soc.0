Return-Path: <SRS0=AlHn=JS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43D4C433B4
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Apr 2021 22:08:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B16361437
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Apr 2021 22:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B16361437
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JmTOJpX67FCZH6hH5wM7Ob9kIc9+ljRE4ALfmOyNdBg=; b=IpiNdMMGFuMPZ6RxMBBfCgsl3
	lNppLz4u0trSnRdJGr9D1YkpOtg4fV42ElIZtOPe/sLbh1UnaY464pp7Yo5Gn5TWh7vEKG8C7oWCq
	vAAshdv115gP5zCuY5UTJbrlJPFt+u0O5WEptkeZp+BQZtH+KPfU4RhwWjJ9NbHE1TOdn8HoQRUvh
	HPsx97UpFA/dhDkdN/5g7fy1BJi/fLMj/NyQEqMcJNPbHfeKfO8lQcODAk1uLUx9u3zv3RjaiM+6F
	Zd2AnCBBYYr+0eAJWMOMQprpOhL+Te6OWPY1OpUU52vD7cs4n9sCHeAfPJhQOy2/LsljvK3HoC9vQ
	3616Bk9TQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZL1H-00FGWm-Vy; Wed, 21 Apr 2021 22:08:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZL1D-00FGWO-AU
 for linux-amlogic@desiato.infradead.org; Wed, 21 Apr 2021 22:08:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ogAI8lijeVMhpP0KzWT5cWLb3gfzY1kK9mczRtEJ5GQ=; b=okGA/GwXLt4B5fXXbDlT7wEgOQ
 n/HTp3Bdn9lO0e/lOrSPCKFl/L/CM0ol6KGr6U0tlJSlbBEUEGbST/qBLXbi8Mc3lkhxPdx10kqNI
 rjArCOztmSJ1CXSAdRadUGM46DvqrGL1x5a2FSvyC7TYzRGWiNwn9kklPXrPmsMf6T7JENeT4fE9W
 IBpiG/GqySDmuIjv1HcCtJKDj647JQSZphWW3yodg8sObv0G+dSJyQqj28CEcut5/Lh8IjAMmNYut
 8dwds5DlEWWilv/e1ceWC8MzdpMnr81TdnaZTS+ilV5AadDr7L34InUdelZ/+iBrkbX+eDO9uodJu
 nZuNjOTQ==;
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZL1B-00DDjJ-0P
 for linux-amlogic@lists.infradead.org; Wed, 21 Apr 2021 22:08:22 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 65-20020a9d03470000b02902808b4aec6dso35571882otv.6
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Apr 2021 15:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ogAI8lijeVMhpP0KzWT5cWLb3gfzY1kK9mczRtEJ5GQ=;
 b=AxgRtr/96eq4U4DXeO9PQdL3V020J4GdUOOqp0VwQWcUhrdvM03WjHFGGaKHzLF6oY
 8I0Qv641lJkfeo+1fzlb1H7NlPmiYMO0h07YI8uTfQ64fF0BwlFkr2KlvYJI0oo8/6x1
 /1vB5lIjqS7nJmVqXLVrVYNZV3bn7sScuqtsuiDVNh+mA0Ra+y8E/8WdV8wCEOTxLo3i
 +sPq35jBA1wYIsXluJ1iLDj4QRTxzrUQl7Ou7GlddSzRkV2i3dK5FRDoiLXYTUlLjcse
 RUTWJJSXy07QS6N6wYMf+jPwT/iGw1BT39z4CTte2zXymarJh8zdF9d70m+GjIEUnC2I
 Of/g==
X-Gm-Message-State: AOAM533FbxCQ/FWI1jYbWIN3ApCFzmFUdQzXY//kdaoYFrRjNwA9Qh99
 ca/zeLGzc1Uydw91IVQ8k6GvzQstxA==
X-Google-Smtp-Source: ABdhPJw0W0dG7gtawcvuBCeeexKFOXPCEzTcs1o3Os9xSTfMg69F/6plTv+OtgNEaEjEI3FUsTqMoA==
X-Received: by 2002:a9d:7b59:: with SMTP id f25mr249406oto.53.1619042900067;
 Wed, 21 Apr 2021 15:08:20 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x2sm210190ote.47.2021.04.21.15.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 15:08:19 -0700 (PDT)
Received: (nullmailer pid 1702678 invoked by uid 1000);
 Wed, 21 Apr 2021 22:08:18 -0000
Date: Wed, 21 Apr 2021 17:08:18 -0500
From: Rob Herring <robh@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-amlogic@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: mali-bifrost: add dma-coherent
Message-ID: <20210421220818.GA1702628@robh.at.kernel.org>
References: <20210421204833.18523-1-khilman@baylibre.com>
 <20210421204833.18523-2-khilman@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210421204833.18523-2-khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_150821_071610_14D7617D 
X-CRM114-Status: UNSURE (   8.40  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20210421220818.yLZC_WC1De-sdyHRe-_ccnOs1PW8lqyb8wT7pkjmQG4@z>

On Wed, 21 Apr 2021 13:48:33 -0700, Kevin Hilman wrote:
> Add optional dma-coherent property to binding doc.
> 
> Found by 'make dtbs_check' on arm64/amlogic DT files.
> 
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
