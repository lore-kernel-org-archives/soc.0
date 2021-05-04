Return-Path: <SRS0=y0KU=J7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29643C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 May 2021 19:38:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4D3761177
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 May 2021 19:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4D3761177
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+K8oBHoOiZvaWJqSJ4QK80VzbaDQ8qdEfiNNu9Na9jQ=; b=CRZcZ4S7wpFFyPetSEC5acuRr
	Q8psrNSE7+QVB3T7D9KkocDfoOqaObAgwqznMFgewaZbBmzXkh/jJP44Nfir3swhZPnRcUUJnrdW0
	wQSXVt73QLUHvA0kSM7wIfgh7/UgUdwTNSVy776/9Mw8HkR2h8gPT1oBeWUn/VB0pVQtsM3RfumE1
	BdactyusVD/5kXI1qUi2MrfCG15BEJTbsGAzdd2ekPTXnRUTIcPnbApow7b0sssjoXsqh8pi8bM0d
	GqS1947jdgkR7MKDcPmkuB6ITzqEI/swQjPns6c3On9FZNBi11ZyDMLjr6pNH2cIQrpL6CwxhGjAj
	Iv5Y9oahA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1le0pg-00GuDg-Bp; Tue, 04 May 2021 19:35:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le0p7-00Gu9a-6W
 for linux-arm-kernel@desiato.infradead.org; Tue, 04 May 2021 19:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=+ZZN5MzC4HBwyYsz5oFVkaryjGRKyHc1OurMaO1on98=; b=ZIBVqOgZk3foixAmfKwo4ceKox
 dwbR5K6aVLaxNeMg/8ykGbZmyaSgVivfKYMGhMcUCksqYCFnoq/TzfSTgbnltRzlsHwu3AUsKzDyc
 wyAtilTPW121Tq8i2yvBX6vJJpdu900HyXGDzbvt8ky9gus+NnyT8GFA+BgEpuuTVlMkUTD6dJxU+
 IKZEZycejyCZI4a025Js50kCKdrjg0H63rEty1D0yIC5AEPa2zTUPk04wk3q4kVsnJWNjycAAPFIY
 4Xy6E0tzYhl4Rm2sWuf2Ee+vuQ1bXm4L+AEsD+rliFgZtZA+1u3IXlgtEvnqje6wb4u7t4MWvYg3C
 0smnRw9Q==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le0p3-004DmN-9y
 for linux-arm-kernel@lists.infradead.org; Tue, 04 May 2021 19:35:12 +0000
Received: by mail-wr1-x42e.google.com with SMTP id l13so9023587wru.11
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 04 May 2021 12:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+ZZN5MzC4HBwyYsz5oFVkaryjGRKyHc1OurMaO1on98=;
 b=OBDSTLK6TS2hxfIMGeuoLflPHA8AXiJCws1GkQohO8FWzgiFXpnoOVA7LyH3XihoQD
 McGE73KZovVg+hDb6hHPBEfC0l+0cb+VmSfrUtYGzgfXuw1qY4PZE5LYo72G8jBrdTVT
 npV3ELRPB4dx5YS9Swt3WDJXQ0k49TZFMYvOYCXnVGcW+j8DZw6LhZPyarkTUGFQd57C
 NUh5XLFXVq/mm20Wg7lnK15Fqsv1tMSdP36pTZD/fuh6KxhKTOY/Ifk6a2eIpvqr0E8I
 lYAI3fY4WLhfxreKW3TPXuTADjnPn5FkHn+mDtHOEg80Ihe4mlHhGBfSlRVR1F6TY2CL
 2JlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+ZZN5MzC4HBwyYsz5oFVkaryjGRKyHc1OurMaO1on98=;
 b=V7XNsFAz1xi9zKzMwUR0ADmk52Z3Z79LiUSA/t8lYgORsfrEr50aNLoytbNkjoRRqZ
 bRBzt5Johwf1UW0Rn407wjERVgz4H2BrszI4SPIhvvP4pWacpcE9bW0OWGkl9duHTwiP
 b3PkYytDRKVpMz+/wQPs//MQ1ZMESfGc66t9cJktIN5WLv9hgxv4DmRuP/jq1R+itgE7
 LPKdgZoYqJogQk8nrlNzsoP8jciWQmGnoPlG9bIFqmYiWucYV0qWCuYuIwzgym15mvBd
 XFZGeeeBygVf18Jf1pwC4ZD3vzIWqMcYLQKHTbJsGxaLonGoFwxxFHvdijcntc7LB21S
 2vIQ==
X-Gm-Message-State: AOAM530KYSgngxdu3MM9OhzV14sHYFIU+ScMUM0KXMfB5V2LeuZ2s/rD
 2mdOX8Sie+0V9ZK1+OItu3lSuw==
X-Google-Smtp-Source: ABdhPJykddxppzrVNYK7b3KfPVPjx6fcuKA+9RNWbVt10xXoC/wxUepowdxvXMso5j9bqnG0wA/9lg==
X-Received: by 2002:a05:6000:1cc:: with SMTP id
 t12mr34157181wrx.156.1620156906534; 
 Tue, 04 May 2021 12:35:06 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id x8sm17072136wru.70.2021.05.04.12.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 12:35:06 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de, kaloz@openwrt.org, khalasa@piap.pl, linusw@kernel.org,
 linux@armlinux.org.uk, olof@lixom.net, robh+dt@kernel.org, soc@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 3/5] dt-bindings: add vendor prefix for welltech
Date: Tue,  4 May 2021 19:34:55 +0000
Message-ID: <20210504193457.4008384-4-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210504193457.4008384-1-clabbe@baylibre.com>
References: <20210504193457.4008384-1-clabbe@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_123509_364397_4BFF0C46 
X-CRM114-Status: GOOD (  11.28  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210504193455.R4cni6qRUhBRm4Hh3LV9MjK6BfXTeOg9QgRwfMpptaY@z>

QWRkIHZlbmRvciBwcmVmaXggZm9yIFdlbGx0ZWNoIGNvbXB1dGVyIENvIExkLgoKU2lnbmVkLW9m
Zi1ieTogQ29yZW50aW4gTGFiYmUgPGNsYWJiZUBiYXlsaWJyZS5jb20+Ci0tLQogRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sIHwgMiArKwogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbAppbmRleCA3MWNjYmU2ODJl
MTEuLmY5NjQ4YjM3ZGExMiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbApAQCAtMTI0OCw2ICsxMjQ4LDggQEAgcGF0
dGVyblByb3BlcnRpZXM6CiAgICAgZGVzY3JpcHRpb246IFdlc3Rlcm4gRGlnaXRhbCBDb3JwLgog
ICAiXndlLC4qIjoKICAgICBkZXNjcmlwdGlvbjogV8O8cnRoIEVsZWt0cm9uaWsgR21iSC4KKyAg
Il53ZWxsdGVjaCwuKiI6CisgICAgZGVzY3JpcHRpb246IFdlbGx0ZWNoIENvbXB1dGVyIENvLiwg
TGltaXRlZC4KICAgIl53ZXRlaywuKiI6CiAgICAgZGVzY3JpcHRpb246IFdlVGVrIEVsZWN0cm9u
aWNzLCBsaW1pdGVkLgogICAiXndleGxlciwuKiI6Ci0tIAoyLjI2LjMKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxp
bmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
