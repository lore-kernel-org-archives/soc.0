Return-Path: <SRS0=dMJD=UC=gmail.com=singh.kuldeep87k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5448FC433EF
	for <soc@archiver.kernel.org>; Wed, 23 Mar 2022 17:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 219A2C340EE; Wed, 23 Mar 2022 17:52:22 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 74908C340E8;
	Wed, 23 Mar 2022 17:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 74908C340E8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id z128so1758713pgz.2;
        Wed, 23 Mar 2022 10:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TFRXJEScuv6NoH0MKXIcE9CGacdsgUSrF/Tlmi+1uH8=;
        b=QkSoN9aTGcSYlvcc8LQoZ0aNOYAbC33cFCiM7XjkCmjyFNfvPbvMZ+ZopySUnJr6o7
         1oTfm+ayDTSdlXGqUtdZn0SmavDAF3RbNhdbJAfNV5K/OabiQmMQcmveCwZ10wjqLx7B
         gUvZqA+0tKQr96CGX6e8D7ASj02qj/9tAmtIMjP0favfcNwGV2rROA9XoLGOE9fdIvV8
         RVUKcB9wMvj1nMRloeCv/BAfyhGdvw+n4mv7hzqAgMNeZHI8lQv69prVOoJvpS4M7Xsm
         3EbbMRcNOcvlGFkdOylmD1pXxmYmqxNno9hnQ7ZdsfnWdOqQeKjXW4MKuqIlfspoNMDk
         0ktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TFRXJEScuv6NoH0MKXIcE9CGacdsgUSrF/Tlmi+1uH8=;
        b=aa2ztGWxxnLVz3ehmEhMXANZHqinKMHcpDsnIKf3ALyvy31V+FVETRjl6QiaAnNFmX
         m2PuYPJ+Ce/nDktex16GWe0mdEODDPyv+LbfGpoKdIAqlgbHDtWYh1KtxlUjd97/XXcm
         DNfmEyvG7YKZ+tZJHxLrukRyuLAhsAACZ3eve4aITzOmFpFTU13f+epB7AFHnn2v5xR3
         af8ay5Gwy9iFD8YXZvdpbH5rB59Rcutkio4CDndoOqM+zD0NGhjKszgyXEK6X3q9HVTo
         TnFpP0N4v2iVUYsI19QgIHLafYrFNdp3ZliSnNh9hHOIApHtalvsID1uorJMMhVBnvIr
         ksag==
X-Gm-Message-State: AOAM533FTj6WkVZ58zJx5GLiF4xhxRgu/RwzlqZzVeAJe9rmi4dtofPA
	8o+inloh9o6oH1vnKEDnh9yDeX0FpoU=
X-Google-Smtp-Source: ABdhPJzXCu/aArjxa+Nc49g+eQ1BFK3lIWn6QqnHh1xRTHvRdXujIly9H5/H5iF2SlvQgPj/gCYPvA==
X-Received: by 2002:a05:6a00:421a:b0:4fa:9396:638f with SMTP id cd26-20020a056a00421a00b004fa9396638fmr872561pfb.63.1648057940495;
        Wed, 23 Mar 2022 10:52:20 -0700 (PDT)
Received: from 9a2d8922b8f1 ([122.161.51.18])
        by smtp.gmail.com with ESMTPSA id u9-20020a056a00158900b004faad3ae570sm533498pfk.189.2022.03.23.10.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 10:52:20 -0700 (PDT)
Date: Wed, 23 Mar 2022 23:22:14 +0530
From: Kuldeep Singh <singh.kuldeep87k@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: lpc18xx: Update SPI dma properties
Message-ID: <20220323175214.GA92241@9a2d8922b8f1>
References: <20220312180615.68929-1-singh.kuldeep87k@gmail.com>
 <20220312180615.68929-3-singh.kuldeep87k@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220312180615.68929-3-singh.kuldeep87k@gmail.com>

On Sat, Mar 12, 2022 at 11:36:15PM +0530, Kuldeep Singh wrote:
> SPI pl022 describes dma-names as RX,TX.
> Reorder dmas and dma-names properties to follow specified convention.
> And while at it, also fix entries order within dma pairs.
> 
> Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>

Kindly consider this patch obsolete as it's not required.
Thanks for your time and patience.

Regards
Kuldeep
