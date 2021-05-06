Return-Path: <SRS0=qdH4=KB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 287E7C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 May 2021 21:08:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8A8F61078
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 May 2021 21:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8A8F61078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E4C3aC1CoOtbM/0gHmZn+8JPMGooQpeYEF9MsB85LrM=; b=YLp0eBB7AeSvYfEDW93a0+QnI
	zxJz260khkGb3ZnBXB0EWM1RzTXJDV8xAJTO3ojDILbDh8dJ+6p+0rR78gjj1z4u4SSK9LlcIuh/B
	uuGYv9oDKDHPfETad4V3eXdsDdsZzhwdpEB2X6uB/EdM6CImaLHw2ZFUbm+BXz5vT6wPd/xj/m+b4
	ObSwL8K1LP277Xegj+x9tOsqbX/zDeDo8cSj9lfTTqk2qQaWm86sWZZQ1lckL/tny5emYq0xKmpbR
	3jSd9CtDWtd3hQ9I3wEJ54i02UatNdk8BGNwuR2i4brw2jih4y6ZNZSvkeWyEMa27KZZNsxtXF1qL
	jEqByJJUw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lelD2-005Klw-1k; Thu, 06 May 2021 21:07:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lelCx-005KlM-7W
 for linux-arm-kernel@desiato.infradead.org; Thu, 06 May 2021 21:06:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=8NvB2tyPckkIgewV0lmTw4rJstRnCjKDzoP9iBSvnfQ=; b=e2Qe56NY2E9Gc1dCHaFqM5LdMz
 A812nC6oXHachQYU8hZZeM5Uq+EkoHWOZMl1U40moGWLiSBVSLRooWtxTVUHGoZ5hWhx1tFfYhyLg
 f52MdVoHSlQymc6G7gGrGJMPBTBeEQo/vDL2S1f5U2YrU9wsrwStU9T3q+zzSlffQhqpQtmRdgkFh
 PvrhZAJxX9oHJra0S2HZ4saKCthABvDxGFM5qQgBsLNSeeZfHDVMJykTYchtXtw/GkVrZvoicT5U3
 35l5n1GQO4gxNUIyaRn4eNn5embMsRIMyDwdu6jzMFtYBw9ylIiOUgELcGJ/Q8fMo+nKebFDmByxB
 RWxUaFGg==;
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lelCu-006ONZ-Qr
 for linux-arm-kernel@lists.infradead.org; Thu, 06 May 2021 21:06:54 +0000
Received: by mail-ot1-f43.google.com with SMTP id
 c28-20020a9d615c0000b02902dde7c8833eso1178816otk.7
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 06 May 2021 14:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8NvB2tyPckkIgewV0lmTw4rJstRnCjKDzoP9iBSvnfQ=;
 b=ZtQYnlokbukjvN8hhnjvfeHNi8n3lGyT/E+i03/ZwgFPwd0ubSSz+AJkUfT5IFOKxV
 CC+C1D++RHqSK0CEB1+TAgoIR04VDQGD6uMQkFmoloX1udizTwUzxuJNWVUzGKaL18pI
 GqalKE0DsTX2AfBoWPK9Y9HTNMzLCZUIZy1il4aG03u87O7tnc3Nb+rnalWjXyeDIcwU
 /qN26455U5JbA1MqdjEEXzrIPueC61FVgxiNIOwgvz0bu7WdYxqHYpxZpRixdZ09RyC7
 Z6Q/N4H2pVhgKL29j3Oh5scE4QRJXlmPUevJlkwg3LGlz6Pjm2chzvuRZQJ8ACAMMRxN
 ea3w==
X-Gm-Message-State: AOAM533eR77phxkWSUqO/wX3HWsHuHVMjuAxfvPddth3jfB3pu6UGvQM
 M9oskUIjOewhH6YHs6lVwA==
X-Google-Smtp-Source: ABdhPJwFIx0e8c86RcR2tVo7iJB2J6CR53YsYNw6wGVQ7XCn1k0eh+UfytGsFuiJoJspx6n2BQ/8Pw==
X-Received: by 2002:a05:6830:1690:: with SMTP id
 k16mr5270532otr.54.1620335211551; 
 Thu, 06 May 2021 14:06:51 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k7sm729416ood.36.2021.05.06.14.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 14:06:51 -0700 (PDT)
Received: (nullmailer pid 801808 invoked by uid 1000);
 Thu, 06 May 2021 21:06:49 -0000
Date: Thu, 6 May 2021 16:06:49 -0500
From: Rob Herring <robh@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kaloz@openwrt.org, robh+dt@kernel.org,
 arnd@arndb.de, khalasa@piap.pl, linusw@kernel.org, linux@armlinux.org.uk,
 olof@lixom.net, soc@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: arm: intel-ixp4xx: add welltech,epbx100
Message-ID: <20210506210649.GA801760@robh.at.kernel.org>
References: <20210504193457.4008384-1-clabbe@baylibre.com>
 <20210504193457.4008384-5-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210504193457.4008384-5-clabbe@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_140652_887523_74B00BC9 
X-CRM114-Status: UNSURE (   9.34  )
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
Message-ID: <20210506210649.3CrSI-YCQAU9vAQGD9pGK_M5M0r3Z7J2tUughVaNUxM@z>

On Tue, 04 May 2021 19:34:56 +0000, Corentin Labbe wrote:
> Adds welltech,epbx100 as a valid intel-ixp4xx board.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
