Return-Path: <SRS0=HHLn=FS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A3FC4361B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Dec 2020 14:36:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E95C02226A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Dec 2020 14:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E95C02226A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xrN/l9QJSqQoewih5b6yJ2aI96OMJwYUceBwnOPxM0Q=; b=brovW1V9sHzHkEM9N4wLqwZP1
	zHQfu9mhrIJhSxYqN4iWa43oAXO97Qbhro3ph/rqkLX3ewas4H46ymI/E6AI68LeWalB/V40V3nLF
	jqUWXKdGkuwsT90PQzByQCXj7FPu7Z2Zec+xZbpxtBH3u/mJImIHOOvqLgLR1hq8RUDngcq5ZVk0N
	M44JnIJRIDlsEsmrqCCe30g1YStxNh1Aco89Xg4u/78uqD8h567I0OKoR3bfQYqMN6j8DZ7vH9515
	eFwSQTdjg1pPqlKFckXdGtD5+1kkshc6GpjyrVyA254ovopyTVBbSEdwWT/kVm9aO1LbJEsoJZdTt
	TyZEa7qwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koowD-0003kG-HQ; Mon, 14 Dec 2020 14:34:57 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koowB-0003jt-C5
 for linux-arm-kernel@lists.infradead.org; Mon, 14 Dec 2020 14:34:56 +0000
Received: by mail-oi1-f194.google.com with SMTP id w124so16226267oia.6
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 14 Dec 2020 06:34:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pmYimdHqPZCmGoKy+QfoCbZ6cMjYvJ9Ol9TiMKbqo5U=;
 b=TGSt5Y+S8UWWCI0qiRBTKC2upB4ab+8/sZmgHcYLuhZCVIVT2DFjbjBU9zkoF2hHhb
 TbJoWxJ6yAE8OlC0jVxdx0dyU+70qEH40VlVN1RemwDTvdFv8DNyD0q4n+XcXnlLzZDo
 fkbdXDuJZ1CLdIOCeRHlCYGkJkk9gr+JYPuNKzwIk+BDvAkYnEbwUQzO135syAk2LJVX
 982IrslJGml4SDpctXdsbkwBcbewE/XPJzS525Xw2WGZVbsET7lurSgXXH3m4/LCotn9
 fwksC+pMulVXXPINR/sdbiIb7QNd9TXWd7tA5IivdgAvx0lRN4+ZZQLMoxqmtrVu+gIk
 qdPA==
X-Gm-Message-State: AOAM531m9x/uEi7G7NfgLykAQZLH19qqSji9AqEdtsSlknEKGNPc3FDJ
 udLfIE4/cmnIdHC6Y6Bm5g==
X-Google-Smtp-Source: ABdhPJxIZjyrGjwvcSupSDPeypUPaJjXZrJg/DEAYpaJ6OrhlsJtNXtsfhunBmocYWyjVbBoZqy2LQ==
X-Received: by 2002:aca:bc41:: with SMTP id m62mr18229830oif.16.1607956494486; 
 Mon, 14 Dec 2020 06:34:54 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d13sm4354186oti.74.2020.12.14.06.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:34:53 -0800 (PST)
Received: (nullmailer pid 1883746 invoked by uid 1000);
 Mon, 14 Dec 2020 14:34:52 -0000
Date: Mon, 14 Dec 2020 08:34:52 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/4] dt-bindings: Remove PicoXcell bindings
Message-ID: <20201214143452.GA1883626@robh.at.kernel.org>
References: <20201210200315.2965567-1-robh@kernel.org>
 <20201210200315.2965567-5-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210200315.2965567-5-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_093455_421606_35636D1F 
X-CRM114-Status: GOOD (  13.55  )
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
Cc: devicetree@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-kernel@vger.kernel.org, soc@kernel.org, linux-crypto@vger.kernel.org,
 Jamie Iles <jamie@jamieiles.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201214143452.G4PVdkczwyJevKoIQo8-HQs9z1zVt5KhxUZnzOMoSNs@z>

On Thu, 10 Dec 2020 14:03:15 -0600, Rob Herring wrote:
> PicoXcell has had nothing but treewide cleanups for at least the last 8
> years and no signs of activity. The most recent activity is a yocto vendor
> kernel based on v3.0 in 2015.
> 
> Cc: Jamie Iles <jamie@jamieiles.com>
> Cc: linux-crypto@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> I'll take this via the DT tree.
> 
>  .../devicetree/bindings/arm/picoxcell.txt     | 24 -------------------
>  .../bindings/crypto/picochip-spacc.txt        | 21 ----------------
>  .../devicetree/bindings/net/macb.txt          |  2 --
>  .../bindings/timer/snps,dw-apb-timer.yaml     |  7 ------
>  4 files changed, 54 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/picoxcell.txt
>  delete mode 100644 Documentation/devicetree/bindings/crypto/picochip-spacc.txt
> 

Applied, thanks!

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
