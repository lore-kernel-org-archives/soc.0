Return-Path: <SRS0=p3wX=PQ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61119C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Oct 2021 16:39:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24F4761056
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Oct 2021 16:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24F4761056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DQKi+oqcZcSsR3+cnLRj4n9ZRtki6lCKnWKRqzJ8N+s=; b=mpEZqs4NHFzNLP
	CJh++FRLAfPZxeb68i6h/K/5nStZcCMO4LieaOqWeQyaUzMiD5Acky48WwS1d9rPBH31fOHqUjU0H
	F+1VSXFkqwqhOkeYJ78izbU06X1mddOGixle80gL9xr3U1nuEVAjt4UP0YgOChjoCPgOX47BIWTwv
	k6VHjAxmYK1x7z+T446bgVSO9IkqHk8atk+In6NU4OjNDLGLEt2ZYszx1uSU+Mqmz3u+osrazhALl
	lOUf1ke91zxt2hU0veCHrNgqXASvCdCWOxZwhLXo7Ih02bOlBsYdFRTdudrdBcb4/tsygAlpnR8sA
	J7tEs68jRsAGxNyQufXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg8Pj-008bIK-5D; Thu, 28 Oct 2021 16:38:03 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg8Pg-008bHS-05
 for linux-arm-kernel@lists.infradead.org; Thu, 28 Oct 2021 16:38:01 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so5248315pjb.0
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 28 Oct 2021 09:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PkruJgvCEKtNeBSTAXmn2WZSAWgjf0MRa1oVEnouC/M=;
 b=X7tHd4KEratHyV1cjf9TZ3xzAajzacshGUPb0/1twCiqXn6CscCL63H+tTB+9gFXso
 wc8/Feq2gDuQskNPyy9X7bR439iQUB0fMZH/As9CE6A7y5T05Qbx1jGMGyCZPFVQ/71h
 XbQHGCVtJZnHWBH4ZM5nBBwBcMqDe85PlYP7hrC+YVeysOzIdOsoerHnKXAqjTmFhsBv
 nCJGJeHI5MOpV2be0rFE3Eck/lCfeUOWXU9iQHJdErUPMgIscQ6TZSs+XUKM2Gzmp5z9
 uxlCP2bTUZstLxYPafkt2+ncYXsQzKKU0Wdj1Y9Jad49DS+Dx1sHRDvdYKsPT7NAYs2q
 xu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PkruJgvCEKtNeBSTAXmn2WZSAWgjf0MRa1oVEnouC/M=;
 b=UFdQq67kangobRfzg2VWLvI8U3bzCghVezZvglji0XJS6UVPBRoDaXKzoC+nzA2Z+4
 zaZf/GOphhC8wxo3hUjca9JD6m6Nf/o0sgHnKMzVqeMcuOfdxCCQbQkwSJXf+TjRljOj
 8MZ5yNic/S3Uv7oJxVUxeBdGdNLnVWtzSvwuq3RZdOx0RgJtwk/qCTp2R8/Ea3B4mm6g
 uPBUlryhTFXLSQYqmm7QnGixedkzZLT1zBuYZ38tCJGtPDvgGJ5hQNH25ryR0n6NKyCs
 4PO/TsVUUArdGyUKIaslUZdbPxKRCyZ/rV4kvS3birNhoLd13y3td4CF0F29gycG29+L
 TOvw==
X-Gm-Message-State: AOAM530EmojjCEV1OHRM2gLcXHZ++aBbzdrhd31EQjtWaZhtFIJ+eLiL
 3AEHBsL97FpMzsTQxcy7jKkOWacSl2M=
X-Google-Smtp-Source: ABdhPJzAA+I1WxBM6NEmBXEEiJJfndd52j2hrja2YR3AE4b0sWzFdJEA/mzD84O6sNsdW5j0zrznAQ==
X-Received: by 2002:a17:902:da90:b0:140:55f8:ca63 with SMTP id
 j16-20020a170902da9000b0014055f8ca63mr4883894plx.72.1635439078522; 
 Thu, 28 Oct 2021 09:37:58 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id d2sm4445481pfj.42.2021.10.28.09.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 09:37:58 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MAINTAINERS: Update BCM7XXX entry with additional patterns
Date: Thu, 28 Oct 2021 09:37:56 -0700
Message-ID: <20211028163756.4014059-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_093800_075323_D1BC4E87 
X-CRM114-Status: UNSURE (   9.76  )
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
Message-ID: <20211028163756.RgohDnV0ippVkVm7PZI4dStTffWyKqDK050EzZo2WY4@z>

Broadcom STB systems use the bcm7038 pattern as well as the bcm7120
pattern for some of its drivers, add those to the existing entry.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index eeb4c70b3d5b..c61fd406acc5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3609,6 +3609,8 @@ F:	arch/arm/mm/cache-b15-rac.c
 F:	drivers/bus/brcmstb_gisb.c
 F:	drivers/pci/controller/pcie-brcmstb.c
 N:	brcmstb
+N:	bcm7038
+N:	bcm7120
 
 BROADCOM BDC DRIVER
 M:	Al Cooper <alcooperx@gmail.com>
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
