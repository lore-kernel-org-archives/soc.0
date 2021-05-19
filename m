Return-Path: <SRS0=N8cr=KO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329B5C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 May 2021 19:52:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E797761042
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 May 2021 19:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E797761042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K8hQwyls851kE7n2gXVLrVohbcbNNx9mAqgS5UHyP/M=; b=GgvMRnSXzYFYf8jOKarVrLF1h
	CsJEGnUpt4GvHSaQM0I7p6XexxzmgzKzfdpX2tNgt3+/X8sajMhVPKppt7ZhTBtzeN0uDn/w38NSy
	sJ3wzPiWSIOcsfmRPP8cmz+YEicb5YX5x5YZgpmfQ1ANW9a5RZnWwQv6xBNv3Q3sqAxNrjqExg+jb
	MHkwxt6LlIxxvN0RY/kcLGxVq8XgWkGAOdJqz3Yp1mEokmUkCb7qd6upPouMrOURzvVxuEk+zo2wO
	NmP6RRbELdtdQPkJNK9uCfQIqseWCOO9CTElWeIpUXjijBtJLILVTAr/GbyhWfE4wAxREVIXboFV8
	+kMAIkhxw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljSDC-004wdC-5K; Wed, 19 May 2021 19:50:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljSDA-004wc1-8Q
 for linux-arm-kernel@desiato.infradead.org; Wed, 19 May 2021 19:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=I1uvTDG2OZUbucg6l58mULhf0aAS9KnjR9rg8Nbg/Jo=; b=IfmO7HSOe9aKqv6134Mauu4Kww
 E/C8LCUj0T/uHLPW0HcctoBE7Tv3ZhyT+xp3oejY4eLBoU8Y9oI+cqn3BH9KlWowg2UF6iazrmv2M
 LDmpfE8rIzE3z5aw+aA2G7WCIufJsNaIYIIhFREH2q73Nq4YU3EY4MKZ8ihGlk+TzUnguE2HtK5yX
 +7qyuGeA0S2yjUoUclZsnStdOcHaGD7JfLieuKGp/awZv+7SdP8anJAk+KKwDfHHlKqnSk/qLTds4
 8vVYJH/G+s4YpjNOq8s5YTmxTdqUdMzOvzEqTKU+t/KT6fTrYpBCc5y5SGaQnzfOSB4MghRp2qjIj
 L5iz6wxw==;
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljSD6-00FkTl-Dh
 for linux-arm-kernel@lists.infradead.org; Wed, 19 May 2021 19:50:30 +0000
Received: by mail-ot1-f50.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so12816615otg.2
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 19 May 2021 12:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I1uvTDG2OZUbucg6l58mULhf0aAS9KnjR9rg8Nbg/Jo=;
 b=OPMLWQXBQ91mVDRBI7JhcvsKim/S2EMKO2GcWCaBB4aNExIVqUCQ6RfiuyDfBcQf7x
 G3WMFZsrUjITJbkHVpYrrAW0l1gz2gwrWapPbmFIaMAIvWwiWwiL8Z/ywEXnRk8kA7xn
 uwCQSYMPjp4iSE1xlAHBiBS62YMsn/IKNfBZPE7jvDMNK88W4j9K6TYRXyMZ8/2xMpb0
 57xlP+UfucI43+2hiCjtfy4MlmlgsoVdFjNkUnd5GJ0AuH35XMuMe5EE60Nq4WOYikHO
 cVZ3O+LxZrp3IYAJaI0yE7MV11v2PaGtjGxvyo+yyTpaphCmmWRHHHJBrQmedCAuhqAU
 YZYA==
X-Gm-Message-State: AOAM532L3o74j5wttl9sYOpIp+Jfnjk3maZRoKUqWwmVmDBVBg72whWO
 xDlYn4gsiMc5ptsBCCmTFQ==
X-Google-Smtp-Source: ABdhPJwrHVc2P5vLxQ+BR4go+vILSaFqfZHLcQ3INgskiyPhp8eJ8bI+GvqEIxWP2XOunEwh6KIdSA==
X-Received: by 2002:a9d:644f:: with SMTP id m15mr954049otl.99.1621453826858;
 Wed, 19 May 2021 12:50:26 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n193sm124169oig.49.2021.05.19.12.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 12:50:25 -0700 (PDT)
Received: (nullmailer pid 3534510 invoked by uid 1000);
 Wed, 19 May 2021 19:50:24 -0000
Date: Wed, 19 May 2021 14:50:24 -0500
From: Rob Herring <robh@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 soc@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org,
 ulli.kroll@googlemail.com, linux-arm-kernel@lists.infradead.org,
 olof@lixom.net
Subject: Re: [PATCH 2/5] dt-bindings: add vendor prefix for edimax
Message-ID: <20210519195024.GA3534096@robh.at.kernel.org>
References: <20210517193205.691147-1-clabbe@baylibre.com>
 <20210517193205.691147-3-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210517193205.691147-3-clabbe@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_125029_453281_0EE14A8A 
X-CRM114-Status: GOOD (  10.30  )
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
Message-ID: <20210519195024.fLPbWRXBgQD8ZMRPqxu_YOe2vnlVZ_70EMPdQOjJYRw@z>

On Mon, 17 May 2021 19:32:02 +0000, Corentin Labbe wrote:
> Add vendor prefix for EDIMAX Technology Co., Ltd (https://www.edimax.com/)
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
