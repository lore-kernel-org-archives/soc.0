Return-Path: <SRS0=i+Gf=KF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3AFC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 May 2021 15:51:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B60E16147F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 May 2021 15:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B60E16147F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kMhpRDQ1HvH0UQ2FUSrBoDfsYcVEKMlV+V5oaiQCM5w=; b=GiN9I1Rx5n1ZNzuBPsFQGeI/E
	9RyzB+UAyj1y/E1f7Lq4SfX0N6rfXc8BZG2kk6qX5W0vPAT6EKJUH5WzuPtb+k+wlreGqog1ZRPaf
	fSKCp/i+c+5oDD+LvXXz4QWs6h4qJ2hHgb55hdsi/nt6yQMnUPDZ+BVoKMNNewRrzfdpbFj0TU4NR
	8yds4Z7iIY/xkNfuwgx7b9/zGpRuUM+21gp6ntszFk4Fa4691kNlNsbB8Ui91KeQcQMkAktZMlR6s
	Jooxvkjkaj0xIgORi5eDqDDOLFCLtSDQIyeDZp9KyB1gQufJR5WAnC6csq+ROBZWrc7GEx27BEMnN
	KS9KzARPw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg89x-00Eouo-Bq; Mon, 10 May 2021 15:49:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg89t-00EouI-Tr
 for linux-arm-kernel@desiato.infradead.org; Mon, 10 May 2021 15:49:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=jbgJ2xIcj4Tn125ILT0iif80RhniBOFq8W6ICy6OMZc=; b=tBNPW1xOlge5wF5Qwt7DBp1kRo
 LDrnnIXOjNhRhNy1GP/15T1DM4dRfccpTm+b/qJ8itaQq5jSNZ2a7FGBcVSIBFDaXTxrJuvT6eSo5
 9j26mG2Pc6EBL1Iq1dOtDgundEZoxTd/RjSkFuzGmrknIjzRRzI5FS3DyMqxM6jXHRb1KJFyrM8RT
 STjcIo6yquVG03P8btj3F7JTU90MsGP6skj7LuLZd8ZdmOhsBXaFgraN1aR1Mc/gy1KggTC/Obexy
 m/rULeQuuftNVHvpNuKD6lxKnPqxLzjsW9rp12I20by5yEj544TZovOAF9zF9aX168m/Ho50p42AG
 yY+NcUJw==;
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg89r-008szE-HY
 for linux-arm-kernel@lists.infradead.org; Mon, 10 May 2021 15:49:24 +0000
Received: by mail-ot1-f43.google.com with SMTP id
 q7-20020a9d57870000b02902a5c2bd8c17so14841301oth.5
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 10 May 2021 08:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jbgJ2xIcj4Tn125ILT0iif80RhniBOFq8W6ICy6OMZc=;
 b=BcKbOL59iMok+ymfHN4hbp36qtAYJzqIxPJDcxvHxiOKFIzzVxHmHHQt05Z2uRjSm8
 7KrWPJUk+EFqXIjyeQ25NfSzbMe72m6Ky/Gy/h6qkAZqReb7/16QyEuqNH3iAjA1KCet
 OdX5WzAT11ZnUublG0z58Wjt6IM4rYFPkRPG4mT31eqLJWoEPSJmPIZyJI2G8f4YB6Ba
 XW2kO5MB1H6aM1yw04jn7PdAZGZhYG9haXlM25FVbFWUt98h0f3Gx3BrcjvsT7EnPY5D
 72fwGfbYuNLf1bvcCdLcB5+VPpTPnrdOCBfws6Jjr1a2tOYMdZREzwooP9pthA2kpETq
 TBlw==
X-Gm-Message-State: AOAM530QRqFIZOS2JL9kM3AMJ1qzknfcIN/vS1xpSEEOyNf7vkaF6OzK
 nC7bFcbvZt4UPI5LScB6kA==
X-Google-Smtp-Source: ABdhPJxqwatdUXu5iD5ufgA065ek3wwc3mDJfGRnXDZj4TVrpVHHBi/u5IzRcZZV+NBBHDIQv89GQA==
X-Received: by 2002:a9d:6a88:: with SMTP id l8mr22407633otq.236.1620661762113; 
 Mon, 10 May 2021 08:49:22 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 19sm1129696oiy.11.2021.05.10.08.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 08:49:20 -0700 (PDT)
Received: (nullmailer pid 185884 invoked by uid 1000);
 Mon, 10 May 2021 15:49:19 -0000
Date: Mon, 10 May 2021 10:49:19 -0500
From: Rob Herring <robh@kernel.org>
To: Eugen Hristev <eugen.hristev@microchip.com>
Subject: Re: [PATCH 1/4] dt-bindings: ARM: at91: document sama7g5ek board
Message-ID: <20210510154919.GA185855@robh.at.kernel.org>
References: <20210507152655.182558-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210507152655.182558-1-eugen.hristev@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_084923_600268_45221DC0 
X-CRM114-Status: GOOD (  10.12  )
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
Cc: devicetree@vger.kernel.org, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, ludovic.desroches@microchip.com, soc@kernel.org,
 robh+dt@kernel.org, codrin.ciubotariu@microchip.com,
 claudiu.beznea@microchip.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210510154919.GwxTVpv0IfkM5h0J4PX-dFXzHu_vE-JH1DbQq3cA-yU@z>

On Fri, 07 May 2021 18:26:52 +0300, Eugen Hristev wrote:
> Document the SAMA7G5 Evaluation Kit based on sama7g5 SoC.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  Documentation/devicetree/bindings/arm/atmel-at91.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
