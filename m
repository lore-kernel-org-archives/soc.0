Return-Path: <SRS0=GqV7=PN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95401C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Oct 2021 20:13:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FA1D604E9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Oct 2021 20:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3FA1D604E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9exwkssQLA51tor2YOLf4kMl6my/arWXbx/IBNpo/Gg=; b=IE3mdL7EV/zghT
	EwE3lB2TuvYfqf3Z50VUNZGpIbuUuVHTyg7iZfyGR/TU82WaqNG943Rq7EClfTnrXktUZvqMByPny
	hJqNoazp9Ndnb1CGwzkpw5SEavYdcG+aJfj4+DRGG5s9LuVB/X4cJUOOUEwxyGnXJOiwVzdmtnjAh
	+XX7kXLmReORm3H/RH5OJAXjkoWJTEQ6ko7Cf8OztmeVjbphZxOsSSyzxBzAx87zDLb+rA53TlFF+
	3GDH3e5Acti5eoHo+ZwkdfIUDtkFa8hfNoq0cKG+/v+bgHg5wRyuvxXJR2EFHiotZn6bhD+jGVGmO
	1HHO0bsWighil4Fh0oOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf6KS-00HZ3u-Q4; Mon, 25 Oct 2021 20:12:20 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf6KO-00HZ1W-LC
 for linux-arm-kernel@lists.infradead.org; Mon, 25 Oct 2021 20:12:18 +0000
Received: by mail-ot1-x332.google.com with SMTP id
 p6-20020a9d7446000000b0054e6bb223f3so16587090otk.3
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 25 Oct 2021 13:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vA/CE8tf842bYqq8xkTI5gJmfVh7UR2D5fj0Mld4W6s=;
 b=HgciXcK1j11C3WxpCUFggFy42vlLBbDqPAH8m/VUMHP9glyYYXAF1orhW+CdfObMSj
 wk7G5OC+Fy79xi3J4Vn/owoj74VwCoxe9qNpy0vDODL02E0h9JBq8/r/n2IM087M9C1D
 fWjrkgvPJlroPmE5AvcVmR3axTOCuwMlOEyQta6+3t8rH8Hp7SXdixuHPLRZ3CUSICMz
 B5+Dt1UqbqXcVaEUPkqL2nC12A/dK0WjeFNsZtLSgUcdjyoNu4GnxDy9BF1YPxe9iJ+3
 t5WdSSKs3ufgvUsWXLVFOGP+Qq8Rkk3eMU6CXE4blXrlL4WE6EE75Qia9fo2K/JKRSOJ
 C8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vA/CE8tf842bYqq8xkTI5gJmfVh7UR2D5fj0Mld4W6s=;
 b=B3outnMQ5IILa0flpDH6+vLL/Hfx8vkBx5tc2ebdxodnfepCc7iYed5Rj+45yVxkTQ
 fQ31po8MiSOJMFHS7xIx8x1Z2MASI7dOs1QgF1ToT7r3JkHb5gIjbaTue8GM3UhnP3rZ
 KuQSlHVQHMbz+H5awmJSJYiVggitW1aZ3TD5WQTGTMMyUgKXn67iDarqfOAQQQAGhXc0
 h94PzjS1YNyWyG8FN4TVMZITLK6nHGvZ3weJsxMTqRK3qvOdU7mx/JqB8CNadpbzzkao
 GRZ6vdskx8vcK+Wg68ojKHSSZmIg4B4NPgspoHFgJ904FKtDr8uJXArLF5LoxjcnyaoX
 gvjA==
X-Gm-Message-State: AOAM5303FGVIl8bYe3cHFSfWrxZT5k1Q6JLnhwl6sWvaFaTBsHw3ro5K
 LazCOmWb3+Fr8r0afGWug+lKQG0MPXVjjE8i
X-Google-Smtp-Source: ABdhPJxq+gvESjkG+CE4IiqKiokANqUfFi8wFAY+fGKV2JBeSFGrVLYJWNB03zZZvt34VIw7q5yLzw==
X-Received: by 2002:a05:6830:1c64:: with SMTP id
 s4mr14998879otg.174.1635192734647; 
 Mon, 25 Oct 2021 13:12:14 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id v9sm3822211oth.62.2021.10.25.13.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 13:12:13 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
 Amit Pundir <amit.pundir@linaro.org>
Subject: [GIT PULL] Qualcomm ARM64 DTS one more fix for 5.15
Date: Mon, 25 Oct 2021 15:12:13 -0500
Message-ID: <20211025201213.1145348-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_131216_718504_E43FFD85 
X-CRM114-Status: GOOD (  11.49  )
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
Message-ID: <20211025201213.R0GJgigp59jFZIZp381XTeUmFR1r1RVJdYRp5ge05RY@z>

Sorry for the late fix, I hope we can still squeeze this in to make sure the
Qualcomm RB5 boards will boot v5.15.

Thanks,
Bjorn

The following changes since commit 1878f4b7ec9ed013da8a7efb63fed1fbae0215ae:

  arm64: dts: qcom: sdm630: Add missing a2noc qos clocks (2021-09-24 10:05:22 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-5.15-2

for you to fetch changes up to e091b836a3baee4c8b1423a969589196b88a9e06:

  Revert "arm64: dts: qcom: sm8250: remove bus clock from the mdss node for sm8250 target" (2021-10-25 14:26:00 -0500)

----------------------------------------------------------------
Qualcomm ARM64 DTS one more fix for 5.15

This reverts a clock change in the Qualcomm RB5 devicetree which in some
combinations of firmware and configuration causes the device to crash
during boot.

Data on an adjacent platform indicates that this is probably not be the
root cause of the problem, but this resolves the regression seen on RB5
and will allow the SM8250 platform to boot v5.15.

----------------------------------------------------------------
Amit Pundir (1):
      Revert "arm64: dts: qcom: sm8250: remove bus clock from the mdss node for sm8250 target"

 arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
