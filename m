Return-Path: <SRS0=wDPU=OU=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ECFCC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Sep 2021 02:57:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D97CE61368
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Sep 2021 02:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D97CE61368
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cy0ahhnu2wTiQRxAjCQFyCs85UyS3SMoYCofdpzicUo=; b=W9tn7zMHmEjxGp
	qE2v+icV4u3MxZvaPY9+XSsdCNu2h/FejOeGo/0n1UrGHDKRJN2oxFvCgV4TkMZzsyHBQlz7sTGcD
	7BV7DNKldHdJh8/pEWpP7Jm61+6c2ea3Go92GtUeZGjYKQMTDA6jS9VqyRORnTKzGJt1IswFzEl/l
	/50JJMHJhUiyxH03nRRPE47FluyaAPOBLYcN+wemrc8BjlVphnNQwOdwHaMqJkJTa0biad4qK/8v3
	Lu1uJjvrbmBeuuxV3OfzbDwBy5S4fA3EAiKxIt9AGwG+lJ6WWxS/cyE7HvQSGzZQ9c7M6FIFdNkpV
	43oCfmrelI0wigIOs7oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVmEO-00CqqV-48; Thu, 30 Sep 2021 02:55:32 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVmEK-00Cqpr-44
 for linux-arm-kernel@lists.infradead.org; Thu, 30 Sep 2021 02:55:29 +0000
Received: by mail-ot1-x330.google.com with SMTP id
 l16-20020a9d6a90000000b0053b71f7dc83so5486384otq.7
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 29 Sep 2021 19:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JJWG2OEeplITAKWNwOIX3nc4uerEIugG53buzU1RsdY=;
 b=H5k3EYAxITPFMuZqEBLKmqnIhBiwLXm8+Ok+Lhtw2TbFArLgQDpDKjh16JVmYhrNfQ
 LaqEdgWJ6GjeLcpRrFwn0uhTqfd1SM92f1Utj76bZde8vOG58JgfDtS4LPPj2i4LRhzQ
 8Aq6FgozxwddjOhRw82heD78xIa88lPU2OhWO3zUsW7lnSw1fC9VraR7faejoGi7p2Rl
 +FV1ZrXBjhEXugr7QCBOSXr4PnKiF7ieW/3ZM0i7KinkmDtZuBVyIF78Js/P8gxWif2C
 mxDyPveg/7YQ6gN4++tgF/fm3n/jVxgczjU5R/8abqn2skP/xFlQ1mUOEtrRerZTOeJd
 sNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JJWG2OEeplITAKWNwOIX3nc4uerEIugG53buzU1RsdY=;
 b=ghjL9Loa4yt3TcTXiRrxKd+21QXZP8s7NUUGHBJc5T0ASDbEuIiIWseGYeoB1olDGg
 sOyBiSaG/QnuTYx4I5cpRTNZAy+9VL7a2AstNEownCiiSjOjC7bwNG2fhY/RBD10OZCo
 DsxUbeiRP7KCMNoBG6hu78u52Ob/034eDYyorIPj992idqw1/HruJNGeWiamhHmrFM0N
 mFFG9R+nyjTz1VUyGCTwiiCwlCUDmCkL/6Fr+CugkWyky8uqmKLqYiWTSqAuUW9leunW
 NPJv5J9IitpU/Dgk/KrFRs2PccuUBHGEkjFYYO+uegmLPJUzzXTrVUEaUUcjnazAILGi
 C13A==
X-Gm-Message-State: AOAM5311lgl/99Zmtlru11Yg5snBQOdGX5CU33V2FdrmWtdO6t80EXpJ
 xF5Y10oMAIcUshDwuppRe87EfA==
X-Google-Smtp-Source: ABdhPJxRRRu9Jy4mBGdA2FQ+J3cuyWDSDAy6FAREe8NCBpOsAJk5JDiyzn2C1v00Ta0ixkFlQXM4/Q==
X-Received: by 2002:a9d:4910:: with SMTP id e16mr2935855otf.170.1632970527171; 
 Wed, 29 Sep 2021 19:55:27 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id x28sm370202ote.24.2021.09.29.19.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 19:55:26 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
 David Heidelberg <david@ixit.cz>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [GIT PULL] Qualcomm DTS fixes for v5.15
Date: Wed, 29 Sep 2021 21:55:26 -0500
Message-ID: <20210930025526.1146-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_195528_190091_8F28D328 
X-CRM114-Status: UNSURE (   8.10  )
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
Message-ID: <20210930025526.J61tZ6QHCQ3ro1QZCj7FUa0lfCZC__FSDo-7Un1WUiY@z>

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-fixes-for-5.15

for you to fetch changes up to ecf5b34cd5182180ff47ca14ecaca0a90db7fd1d:

  ARM: dts: qcom: apq8064: update Adreno clock names (2021-09-19 23:11:27 -0500)

----------------------------------------------------------------
Qualcomm DTS fixes for v5.15

This corrects the use of depricated chipid and clock names, for which
support was finally dropped from the driver. It also ensures that the
DSI PLL is fed by the correct clock, now that it's being migrated to not
rely on global clock names.

----------------------------------------------------------------
David Heidelberg (2):
      ARM: dts: qcom: apq8064: use compatible which contains chipid
      ARM: dts: qcom: apq8064: update Adreno clock names

Marijn Suijten (1):
      ARM: dts: qcom: apq8064: Use 27MHz PXO clock as DSI PLL reference

 arch/arm/boot/dts/qcom-apq8064.dtsi | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
